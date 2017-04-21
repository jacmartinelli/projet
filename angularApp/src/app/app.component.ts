import { Component } from '@angular/core';
import { Student } from './students';
import { StudentService } from './students.service';


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers: [StudentService] 
})

export class AppComponent {
  title = 'Wonderfull Students';
  selectedStudent: Student;
  students: Student[];
  constructor(private studentService: StudentService) { }
  getStudents(): void {
    this.studentService
        .getStudents()
        .then(students => this.students = students );
  }
  ngOnInit(): void {
    this.getStudents();
  }
  onSelect(student: Student): void {
  this.selectedStudent = student;
  }
}