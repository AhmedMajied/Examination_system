﻿using Part_Of_Project.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

namespace Part_Of_Project.Controllers
{
    public class CourseController : ApiController
    {
        private DBEntities db = new DBEntities();

        [HttpGet]
        [Route("api/getCoursesNumber")]
        public IHttpActionResult GetCoursesNumber()
        {
            return Ok(db.Courses.Count());
        }

        // GET: api/Course
        public IHttpActionResult GetCourses()
        {
            var c = db.Courses.Select(cc => new { cc.ID, cc.Name, cc.Description, cc.DepartmentID, deptname = cc.Department.Name, cc.Photo });
            return Ok(c);
        }

        // GET: api/Course/5
        [ResponseType(typeof(Cours))]
        public IHttpActionResult GetCourse(int id)
        {
            var course = db.Courses.Where(c => c.ID == id).Select(c => new {
                c.ID,
                c.Name,
                c.Description,
                deptname = c.Department.Name,
                c.Photo,
                c.DepartmentID,
                InstructorID = c.Instructor.ID,
                instructorName = c.Instructor.Name,
                instructorPhoto = c.Instructor.Photo,
                instructorBio = c.Instructor.Bio
            }).SingleOrDefault();
            if (course == null)
            {
                return BadRequest();
            }

            return Ok(course);
        }

        [Route("api/GetDepartmentCourses/{id}")]
        public IHttpActionResult GetDepartmentCourses(int id)
        {
            var courses = db.Courses.Where(c => c.DepartmentID == id).Select(cc => new { cc.ID, cc.Name, cc.Description, cc.DepartmentID, deptname = cc.Department.Name, cc.Photo });

            if (courses == null)
            {
                return BadRequest();
            }
            return Ok(courses);
        }

        [Route("api/GetInstructorCourses/{id}")]
        public IHttpActionResult GetInstructorCourses(int id)
        {
            Instructor inst = db.Instructors.FirstOrDefault(c => c.ID == id);
            if (inst == null)
            {
                return NotFound();
            }
            return Ok(inst.Courses.Select(c => new { c.ID, c.Name }));
        }

        [Route("api/GetStudentCourses/{id}")]
        public IHttpActionResult GetStudentCourses(int id)//???
        {
            Student st = db.Students.FirstOrDefault(s => s.ID == id);
            if (st == null)
            {
                return BadRequest();
            }
            return Ok(st.Courses_Students.Select(c => new { c.Cours.ID, c.Cours.Name }));
        }

        [Route("api/GetStudentCourses/{id}")]
        public IHttpActionResult GetStudentCoursesGrade(int id)
        {
            Student st = db.Students.FirstOrDefault(s => s.ID == id);
            if (st == null)
            {
                return BadRequest();
            }
            return Ok(new { st.Name, courses_name = st.Courses_Students.Select(c => c.Grade) });
        }

        // PUT: api/Cours/5
        [ResponseType(typeof(void))]
        [HttpPost]
        [Route("api/course/update")]
        public IHttpActionResult Update(Cours course)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Entry(course).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CoursExists(course.ID))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        [HttpPost]
        [Route("api/course/add")]
        public IHttpActionResult Add(Cours cours)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                db.Courses.Add(cours);
                db.SaveChanges();
            }
            catch (Exception)
            {
                return BadRequest("unique");
            }

            return StatusCode(HttpStatusCode.Created);
        }

        // DELETE: api/Cours/5
        [HttpGet]
        [Route("api/course/delete/{id}")]
        public IHttpActionResult Delete(int id)
        {
            try
            {
                int isAdmin = Int32.Parse(Request.Headers.GetValues("isAdmin").FirstOrDefault());
                if (isAdmin == 0)
                    return Unauthorized();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return Unauthorized();
            }

            Cours cours = db.Courses.Find(id);
            if (cours == null)
            {
                return NotFound();
            }

            db.delete_Courses(id);

            return StatusCode(HttpStatusCode.NoContent);
        }

        [ResponseType(typeof(Cours))]
        [HttpPost]
        [Route("api/joincourse")]
        public IHttpActionResult JoinCourse(Courses_Students cs)
        {
            try
            {
                db.Courses_Students.Add(cs);
                db.SaveChanges();
                return Ok(cs);
            }
            catch
            {
                return BadRequest();
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CoursExists(int id)
        {
            return db.Courses.Count(e => e.ID == id) > 0;
        }
    }
}
