import { Component, OnInit, Input } from '@angular/core';
import { CourseService } from 'src/app/services/course.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-exams-modal',
  templateUrl: './exams-modal.component.html',
  styleUrls: ['./exams-modal.component.css']
})
export class ExamsModalComponent implements OnInit {
  @Input() courseID;
  exams
  constructor(public router:Router,public webService:CourseService,public activatedRoute:ActivatedRoute) { }

  ngOnInit() {
    this.webService.getCourseExams(this.courseID).subscribe(
      (response) => {
        this.exams = response
        console.log(response)
      },
      (error) => {
        console.log(error);
      }
    )
    
    }
}
