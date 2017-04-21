import { Component, Input } from '@angular/core';
import { Student } from './students';

@Component({
  selector: 'student-detail',
  templateUrl: './student-detail.component.html',
   styleUrls: ['./app.component.css']
 })
 export class StudentDetailComponent {
   @Input() student: Student;
 }