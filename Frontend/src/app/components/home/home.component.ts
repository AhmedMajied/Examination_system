import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  courses_number:number = 3;
  teachers_number:number = 3;
  
  constructor() { }

  ngOnInit() {
  }

}
