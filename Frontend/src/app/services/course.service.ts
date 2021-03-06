import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders} from '@angular/common/http';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})

export class CourseService {

  constructor(private myHttp: HttpClient, private authService: AuthService) { }

  getAllCourses(){
    return this.myHttp.get("http://localhost:54345/api/Course");
  }

  getDepartmentCourses(ID:number){
    return this.myHttp.get(`http://localhost:54345/api/GetDepartmentCourses/${ID}`);
  }


  getCoursesNumber(){
    return this.myHttp.get(`http://localhost:54345/api/getCoursesNumber`);
  }

  getCourse(ID:number){
    return this.myHttp.get(`http://localhost:54345/api/Course/${ID}`)
  }
  getStudentCourses(ID:number){
    return this.myHttp.get(`http://localhost:54345/api/GetStudentCourses/${ID}`)
  }
  getTeacherCourses(ID:number){
    return this.myHttp.get(`http://localhost:54345/api/GetInstructorCourses/${ID}`)
  }

  getCourseQuestions(courseID:number){
    return this.myHttp.get(`http://localhost:54345/api/coursequestion/${courseID}`)
  }

  save(course){
    return this.myHttp.post("http://localhost:54345/api/course/add",course);
  }

  update(course){
    return this.myHttp.post("http://localhost:54345/api/course/update",course);
  }

  delete(ID:number){
    const httpOptions = {
      headers: new HttpHeaders(this.authService.getCookie())
    };

    return this.myHttp.get(`http://localhost:54345/api/course/delete/${ID}`,httpOptions);
  }

  test(deptID:number){
    // const formData = new FormData();
    // formData.append('image', image);
    
    // const httpOptions = {
    //   headers: new HttpHeaders(this.authService.getCookie())
    // };
    
    // return this.myHttp.get("http://localhost:54345/test/test",httpOptions)



    return this.myHttp.post(`http://localhost:54345/api/Student/StudentsExport/${deptID}`,{"Location":"E:\\"});
  }

  joinCourse(student_course){
    return this.myHttp.post("http://localhost:54345/api/joincourse",student_course);
  }

  getTopicsReport(courseID){
    return this.myHttp.post(`http://localhost:54345/api/Student/ListTopics/${courseID}`,{"Location":"E:\\"});
  }

}
