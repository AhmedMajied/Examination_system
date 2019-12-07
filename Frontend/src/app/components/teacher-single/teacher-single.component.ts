import { Component, OnInit, Input } from '@angular/core';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-teacher-single',
  templateUrl: './teacher-single.component.html',
  styleUrls: ['./teacher-single.component.css']
})
export class TeacherSingleComponent implements OnInit {
  teacher = {
    ID: 1,
    Name: "done",
    Username: "sample string 3",
    Password: "sample string 4"
  }
  @Input() title:string;
  constructor(public myService:UserService) { }
  clicked(username,password){
    this.myService.updateTeacherInfo(this.teacher).subscribe(
      (response)=>{
        console.log(response)
        this.title = "Thanks , Your Info Updated Successfully"
      },
      (error)=>{
        console.log(error);
      }
    )
    console.log('dsa')
  }
  ngOnInit() {
  }

}
