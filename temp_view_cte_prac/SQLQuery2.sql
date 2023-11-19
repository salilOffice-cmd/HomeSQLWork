
-- 1. List all students along with the courses they are enrolled in.
Select st.student_name,
	   courses.course_name
From   students as st
Join   enrollments as enr
On     enr.student_id = st.student_id
Join   courses
On     enr.course_id = courses.course_id


-- 2. Show the total number of students enrolled in each course.
Select     courses.course_name,
		   Count(*) as StudentCount
From       enrollments as enr
Join       courses
On         enr.course_id = courses.course_id
Group By   courses.course_name


-- 3. Find the courses with the highest number of enrollments.
Select     Top(1)
		   courses.course_name,
		   Count(*) as StudentCount
From       enrollments as enr
Join       courses
On         enr.course_id = courses.course_id
Group By   courses.course_name
Order By   StudentCount Desc


-- using CTE
With HighestEnrollmentCourse_CTE AS
(
	Select     courses.course_name,
		       Count(*) as StudentCount
	From       enrollments as enr
	Join       courses
	On         enr.course_id = courses.course_id
	Group By   courses.course_name
)
Select *
From   HighestEnrollmentCourse_CTE
Where  StudentCount = (Select Max(StudentCount) From HighestEnrollmentCourse_CTE);



-- 4. Using a CTE to retrieve a hierarchical view of students and their enrollments
WITH StudentEnrollmentHierarchy AS (
    SELECT
        s.student_id,
        s.student_name,
        e.enrollment_id,
        c.course_id,
        c.course_name,
        e.enrollment_date
    FROM
        students s
    LEFT JOIN
        enrollments e ON s.student_id = e.student_id
    LEFT JOIN
        courses c ON e.course_id = c.course_id
)
SELECT     *
FROM       StudentEnrollmentHierarchy
ORDER BY   student_id, enrollment_id;



-- 11. Delete the students with the duplicate name
With DeleteDuplicateStudents_CTE AS
(
	Select *,
		   Row_Number() OVER (Partition By student_name Order By student_name) as StudentRank
	From   Students
)
Delete From  Students
Where        student_id IN (Select student_id
					        From   DeleteDuplicateStudents_CTE
					        Where  StudentRank > 1);




-- 5. Identify students who are not enrolled in any course.

Select      st.student_name,
		    enr.enrollment_date
From        students as st
Left Join   enrollments as enr
On          enr.student_id = st.student_id
Where       enr.enrollment_id is null;    


-- 6. Show the courses with the earliest and latest enrollment dates.

With LatestAndEarliestEnrDate_CTE AS
(
	Select    Min(enr.enrollment_date) as EarliestDate,
			  Max(enr.enrollment_date) as LatestDate
	From      enrollments as enr
	Join      courses
	On        enr.course_id = courses.course_id
)
Select    enr.enrollment_id,
	      enr.enrollment_date,
		  courses.course_name
From      enrollments as enr
Join      courses
On        enr.course_id = courses.course_id
Where     enrollment_date = (Select EarliestDate From LatestAndEarliestEnrDate_CTE)


-- Using a CTE to find courses with the earliest and latest enrollment dates
WITH LatestAndEarliestEnrDate_CTE AS (
    SELECT
        c.course_name,
        MIN(e.enrollment_date) AS earliest_enrollment_date,
        MAX(e.enrollment_date) AS latest_enrollment_date
    FROM
        courses c
    LEFT JOIN
        enrollments e ON c.course_id = e.course_id
    GROUP BY
        c.course_name
)
SELECT *
FROM LatestAndEarliestEnrDate_CTE;
