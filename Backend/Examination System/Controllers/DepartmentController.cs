﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Examination_System.Reports;
using CrystalDecisions.CrystalReports.Engine;
using System.IO;
using System.Diagnostics;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using Newtonsoft.Json.Linq;
using Examination_System.Models;

namespace Examination_System.Controllers
{
    public class DepartmentController : ApiController
    {

         private ExaminationSystemDBEntities db = new ExaminationSystemDBEntities(); 

        
        //return All Depts
        [HttpGet]
        public IHttpActionResult GetAll()
        {
            var Departments = db.get_department().ToList();
            if (Departments == null)
                return NotFound();
            else
                return Ok(Departments);
        }


        //return one Dept
        [HttpGet]
        public IHttpActionResult GetDepartment(int? id)
        {
            var Department = db.Departments.Where(d => d.ID == id).Select(dd => new { dd.ID, dd.Name, dd.Photo}).SingleOrDefault();
            if (Department == null)
                return NotFound();
            else
                return Ok(Department);
        }



        //Delete one Dept
        [HttpDelete]
        public IHttpActionResult Delete(int? id)
        {
            Department Department = db.Departments.Find(id);
            if (Department == null)
            {
                return NotFound();
            }
                
            db.delete_department(id);
            return Ok(Department);
        }

        //Update one Dept
        [HttpPut]
        public IHttpActionResult Update(int id, Department department)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != department.ID)
            {
                return BadRequest();
            }

            db.Entry(department).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DepartMentExists(id))
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





        //Add Departmanet
        [HttpPost]
        public IHttpActionResult Add(Department department)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Departments.Add(department);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { ID = department.ID }, department);
        }

        //check if Department is exist or not
        private bool DepartMentExists(int id)
        {
            return db.Departments.Count(d => d.ID == id) > 0;
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}