# 1.Query the existence of 1 course
select count( * ) from course where id = 1;

# 2.Query the presence of both 1 and 2 courses
select count(*) from course where id in (1,2);

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select
    s1.id,
    s1.`name`,
    avg(s2.score) 
from
    student s1 
left join
    student_course s2 
        on s1.id= s2.studentId 
where
    score >= 60 
group by
    id;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student where student.id not in (select studentId from student_course);

# 5.Query all SQL with grades
select * from student where student.id in (select studentId from student_course);

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select
    s1.id,
    s1.name,
    s1.age,
    s1.sex 
from
    student s1 
join
    student_course s2 
        on s1.id = s2.studentId 
where
    s2.studentId = 1 
    AND s2.courseId = 2;

# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT
	* 
FROM
	student,
	student_course 
WHERE
	student.id = student_course.studentId 
	AND student_course.courseId = 1 
	AND score < 60 
ORDER BY
	score DESC;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT
	sc.courseId,
	avg( sc.score ) AS avgScore 
FROM
	student_course sc 
GROUP BY
	sc.courseId 
ORDER BY
	avgScore DESC,
	sc.courseId;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
SELECT
	s.`name`,
	sc.score 
FROM
	student s,
	student_course sc,
	course c 
WHERE
	sc.courseId = c.id 
	AND c.`name` = 'Math' 
	AND s.id = sc.studentId 
	AND score < 60;