# MySQL_Solutions

# Student Course Enrollment System

This project is a SQL-based implementation of a **Student-Course-Enrollment Management System**. It models departments, instructors, students, courses, and enrollments, and allows querying various relationships between them.

## 📂 Tables Created

- **Department**  
  Stores department information.

- **Instructor**  
  Stores instructor details linked to departments.

- **Student**  
  Stores student details including gender, age, and enrollment info.

- **Course**  
  Stores courses with credit and instructor mapping.

- **Enrollment**  
  Tracks student course registrations and grades.

## ⚙️ Sample Queries Included

- Average grade per student.
- Courses with number of students enrolled.
- Departments with the most students.
- Students enrolled in specific courses (e.g., Math, English).
- Students who scored only 'A' grades.
- Courses not taken by any students.
- Instructors teaching in multiple departments.
- Credits offered per department.
- Gender distribution per department.
- Courses with no grades below 'B'.
- Students who enrolled this year.
- Use of SQL ranking functions like `RANK()`.

## 🛠 Technologies Used

- SQL (MySQL syntax)
- Git/GitHub for version control

## 🚀 Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/repo-name.git
