import { Component, OnInit } from '@angular/core';
import { DepartmentService } from '../../services/department.service';
import { ActivatedRoute, Router } from '@angular/router'

@Component({
  selector: 'app-department-single',
  templateUrl: './department-single.component.html',
  styleUrls: ['./department-single.component.css']
})
export class DepartmentSingleComponent implements OnInit {

  department:{};
  students_number: number;
  teachers_number: number;
  courses_number: number;
  departmentID: number;

  constructor(private deptService:DepartmentService, public myRouter: ActivatedRoute, private router:Router) { }

  ngOnInit() {
    this.departmentID = this.myRouter.snapshot.params['id'];
    this.getDepartment(this.departmentID)
    this.getCoursesNumber(this.departmentID);
    this.getStudentsNumber(this.departmentID);
    this.getTeachersNumber(this.departmentID);
  }

  getDepartment(ID:number): void{
    this.deptService.getDepartment(ID).subscribe(
      (data)=>{
        this.department = data;
      },
      (error)=>{
        console.log(error);
      }
    )
  }

  getStudentsNumber(DepartmentID:number){
    this.deptService.getStudentsNumber(DepartmentID).subscribe(
      (data)=>{
        this.students_number = data as number;
      },
      (error)=>{
        console.log(error);
      }
    )
  }

  getTeachersNumber(DepartmentID:number){
    this.deptService.getTeachersNumber(DepartmentID).subscribe(
      (data)=>{
        this.teachers_number = data as number;
      },
      (error)=>{
        console.log(error);
      }
    )
  }

  getCoursesNumber(DepartmentID:number){
    this.deptService.getCoursesNumber(DepartmentID).subscribe(
      (data)=>{
        this.courses_number = data as number;
      },
      (error)=>{
        console.log(error);
      }
    )
  }

  delete(){
    this.deptService.delete(this.departmentID).subscribe(
      (success)=>{
        this.router.navigate(['']);
      },
      (error)=>{
        console.log(error)
      }
    )
  }
}
