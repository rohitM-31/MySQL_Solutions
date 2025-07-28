-- Create Department table
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Create Instructor table
CREATE TABLE Instructor (
    instructor_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Create Student table
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender CHAR(1),
    department_id INT,
    enrollment_date DATE,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Create Course table
CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    credits INT,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

-- Create Enrollment table
CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Insert data into Department table
INSERT INTO Department (department_id, name) VALUES
(1, 'Science'),
(2, 'Arts'),
(3, 'History');

-- Insert data into Instructor table
INSERT INTO Instructor (instructor_id, name, department_id) VALUES
(1, 'Prof. Adams', 1),
(2, 'Dr. Baker', 2),
(3, 'Prof. Clark', 3);

-- Insert data into Student table
INSERT INTO Student (student_id, name, age, gender, department_id, enrollment_date) VALUES
(1, 'Alice Smith', 20, 'F', 1, '2025-09-01'),
(2, 'Bob Johnson', 22, 'M', 2, '2020-09-01'),
(3, 'Carol White', 21, 'F', 1, '2021-01-15'),
(4, 'Dave Brown', 23, 'M', 3, '2019-09-01'),
(5, 'Eve Davis', 20, 'F', 2, '2021-09-01');

-- Insert data into Course table
INSERT INTO Course (course_id, name, credits, instructor_id) VALUES
(1, 'Math 101', 3, 1),
(2, 'English 101', 3, 2),
(3, 'History 101', 4, 3),
(4, 'Science 101', 4, 1),
(5, 'Art 101', 2, 2);

-- Insert data into Enrollment table
INSERT INTO Enrollment (enrollment_id, student_id, course_id, grade) VALUES
(1, '1', '1', 'A'),
(2, '1', '2', 'B'),
(3, '2', '1', 'B'),
(4, '2', '3', 'C'),
(5, '3', '4', 'A'),
(6, '3', '1', 'B'),
(7, '4', '5', 'C'),
(8, '4', '2', 'B'),
(9, '5', '3', 'A');
