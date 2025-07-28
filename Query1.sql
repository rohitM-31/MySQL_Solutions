use student;
select course.name as cou_name,department.name  as depat_name
from course
join 
department
where course.course_id=department.department_id;

select count(*) from department;

SELECT 
  student_data.name AS stud_name, 
  department.name AS dept_name
FROM 
  student_data
LEFT JOIN 
  department
ON 
  student_data.stud_id = department.department_id
order by
   student_data.name ASC;
use employee;
select * from employee_person;
use student;

select max(age) as sec_highest
from student_data
where age <(select max(age) from student_data);
select * from student_data;

select * from student_data
where gender='M';

select distinct* from student_data s
join enrollment e on s.stud_id=e.stud_id;

select distinct* from student_data s
left join enrollment e on s.stud_id=e.stud_id;


SELECT *
FROM student_data s
WHERE NOT EXISTS (
    SELECT 1
    FROM enrollment e
    WHERE e.stud_id = s.stud_id
);

select * from enrollment;
select stud_id,avg(grade) from enrollment
group by stud_id;

SELECT 
    s.stud_id,
    s.name,
    ROUND(AVG(
        CASE e.grade 
            WHEN 'A' THEN 4
            WHEN 'B' THEN 3
            WHEN 'C' THEN 2
            WHEN 'D' THEN 1
            WHEN 'F' THEN 0
        END
    ), 2) AS avg_grade
FROM 
    student_data s
JOIN 
    Enrollment e ON s.stud_id = e.stud_id
GROUP BY 
    s.stud_id, s.name;
    
    
    
    select c.course_id,c.name AS cou_name,count(e.stud_id) as stud_count
    from course c
    join enrollment e on c.course_id= e.enrollment_id
    group by c.course_id,c.name;
    
    select d.department_id,d.name as department_name,count(s.stud_id)  as maxi_count
    from department d
    join student_data s on d.department_id=s.stud_id
    Group by s.stud_id,s.name,d.department_id
    order by s.stud_id ASC
    limit 5;
    
    
    select s.stud_id,s.name as stud_name ,c.name as course_name
    from student_data s
    join course c on s.stud_id=c.course_id;
    where s.stud_name like 'A%';
    
    
    SELECT 
    s.stud_id,
    s.name AS stud_name,
    c.name AS course_name
FROM 
    student_data s
JOIN 
    enrollment e ON s.stud_id = e.stud_id
JOIN 
    course c ON e.course_id = c.course_id
WHERE 
    s.name LIKE 'A%';
    
select c.name as cou_name,i.name as inst_name
from  course c
join 
   instructor i on c.course_id=i.department_id
where i.name LIKE '%Prof. Adams%';
   
   
SELECT  
    s.stud_id AS id,
    s.name AS stud_name,
    c.name AS cou_name
FROM 
    student_data s
JOIN 
    enrollment e ON s.stud_id = e.stud_id
JOIN 
    course c ON e.course_id = c.course_id
WHERE 
    c.name LIKE '%Math 101%' OR c.name LIKE '%English 101%';
    
select c.course_id,c.name as cous_name,Max(e.grade ) as highest_grade
from course c
join
  enrollment e on c.course_id=e.course_id
  group by c.course_id,c.name;
  
select count(s.stud_id) as total_students,d.department_id,d.name as depart_name
from student_data s
join 
  department d on s.department_id=d.department_id
  group by d.department_id,d.name;

select i.instructor_id,i.name as instrut_name, count(c.course_id)
from instructor i
join 
  course c on i.instructor_id=c.instructor_id
  group by c.instructor_id,i.name;
   
   
   
select d.department_id as depart_id,
	d.name as depart_name,
    count(case when s.gender='M' then 1 END) as male_studnets,
    count(case when s.gender='F' then 1 END) as female_stud
from student_data s
join department d on s.department_id=d.department_id
group by d.department_id,d.name;

select c.course_id,c.name as course_name
from Course c
left join Enrollment e on c.course_id=e.course_id
where e.course_id is null;

select s.stud_id,s.name as std_name 
from student_data s
join  Enrollment e on s.stud_id=e.stud_id
group by s.stud_id,s.name
having 
count(*)=count(case when e.grade='A' then 1 END);

select * from student_data;
 
 select i.instructor_id as inst_id,i.name as inst_name ,
        count(c.course_id) as cou_count
 from instructor i
 join course c on c.instructor_id=i.instructor_id
 group by i.instructor_id,i.name;
 use student;
 select d.department_id,d.name as depart_name,sum(c.credits) as total_credits
 from department d
 join instructor i on d.department_id=i.department_id
 join course c on i.instructor_id=c.course_id
 group by d.department_id,d.name;
 
 select s.stud_id,s.name,s.age,s.gender,s.enrollment_date
 from 
 student_data s
 where
 year(enrollment_date)=year(curdate());
 
 update student_data
 set enrollment_date='2025-02-01'
 where stud_id=1;
 select * from student_data;
 
SELECT 
    s.stud_id,
    s.name AS stud_name
FROM 
    student_data s
JOIN 
    enrollment e ON s.stud_id = e.stud_id
GROUP BY 
    s.stud_id, s.name
HAVING 
    COUNT(CASE WHEN e.grade IN ('C', 'D', 'F') THEN 1 END) = 0;
    
select  s.stud_id,
    s.name AS stud_name
    from student_data s
where 
NOT EXISTS(
select 1 from enrollment e
where e.stud_id=s.stud_id
and e.grade in ('C','D','F'));

select d.department_id,d.name ,avg(s.age)
from department d
join student_data s
on s.department_id=d.department_id
group by s.stud_id,s.name
having avg(s.age)<21;

select s.stud_id,s.name ,sum(c.credits) as totoal_credits
from student_data s
join enrollment e
on s.stud_id=e.stud_id
join course c
on c.course_id=e.course_id
group by 
s.stud_id,s.name
having sum(c.credits)>5
order by s.name;

SELECT 
    s.stud_id,
    s.name AS stud_name
FROM 
    student_data s
WHERE 
    EXISTS (
        SELECT 1 
        FROM enrollment e
        JOIN course c ON e.course_id = c.course_id
        WHERE 
            e.stud_id = s.stud_id
            AND c.name LIKE '%Science%'
    );

SELECT 
    s.stud_id,
    s.name AS stud_name
FROM 
    student_data s
WHERE 
    NOT EXISTS (
        SELECT 1 
        FROM enrollment e
        JOIN course c ON e.course_id = c.course_id
        WHERE 
            e.stud_id = s.stud_id
            AND c.name LIKE '%Science%'
    );

select c.course_id,c.name as course_name
from 
course c
where 
NOT EXISTS(
select 1
   from enrollment e
   where 
   e.course_id=c.course_id
   and e.grade in ('C','D','F')
   );
     
SELECT 
    s.stud_id,
    s.name AS student_name,
    c.course_id,
    c.name AS course_name
FROM 
    student_data s
JOIN 
    Enrollment e ON s.stud_id = e.stud_id
JOIN 
    Course c ON e.course_id = c.course_id
ORDER BY 
    s.name, c.name;

use student;
SELECT 
    s.stud_id,
    s.name AS stud_name,
    s.age AS stud_age,
    RANK() OVER (ORDER BY s.age ASC) AS stud_age_rank
FROM 
    student_data s;

SELECT 
    s.stud_id,
    s.name AS stud_name,
    s.age AS stud_age,
    DENSE_RANK() OVER (ORDER BY s.age ASC) AS stud_age_rank
FROM 
    student_data s;

