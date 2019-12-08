import { Component, OnInit } from '@angular/core';
import { CourseService } from '../../services/course.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-course-single',
  templateUrl: './course-single.component.html',
  styleUrls: ['./course-single.component.css']
})
export class CourseSingleComponent implements OnInit {

  course:{};
  courseID:number;

  constructor(public myService:CourseService, public myRouter: ActivatedRoute, private router:Router) { }

  ngOnInit() {
    this.courseID = this.myRouter.snapshot.params['id'];
    this.getCourse(this.courseID)
  }

  getCourse(ID:number): void{
    this.myService.getCourse(ID).subscribe(
      (data)=>{
        this.course = data;
      },
      (error)=>{
        console.log(error);
      }
    )
  }

  delete(){
    this.myService.delete(this.courseID).subscribe(
      (success)=>{
        this.router.navigate(['']);
      },
      (error)=>{
        console.log(error)
      }
    )
  }

}
