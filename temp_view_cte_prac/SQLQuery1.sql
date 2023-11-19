-- Updating employee salary whose departmentname is IT
select * from Employee;



-- Using temp table
Select emp.EmployeeID,
	   emp.FirstName,
	   emp.LastName,
	   dept.DepartmentName
Into   tempEmployee
From   Employee as emp
Join   Department as dept
On     emp.DepartmentID = dept.DepartmentID


update Employee
set salary = salary + 100
where EmployeeID IN (Select EmployeeID
					 from   tempEmployee
					 Where  DepartmentName = 'IT')


					


-- Using CTE
With updateEmployeeCTE AS
(
	Select emp.EmployeeID,
	       emp.FirstName,
	       emp.LastName,
	       dept.DepartmentName
    From   Employee as emp
    Join   Department as dept
    On     emp.DepartmentID = dept.DepartmentID
)
update Employee
set salary = salary + 100
where EmployeeID IN (Select EmployeeID
					 from   updateEmployeeCTE
					 Where  DepartmentName = 'IT')





-- Using View
Create View vw_EmployeeUpdate
As
Select emp.EmployeeID,
       emp.FirstName,
       emp.LastName,
	   emp.Salary,
       dept.DepartmentName
From   Employee as emp
Join   Department as dept
On     emp.DepartmentID = dept.DepartmentID


update vw_EmployeeUpdate
set    salary = salary + 100
where  DepartmentName = 'IT'

select * from Employee




-- Using SubQuery
update Employee
set salary = salary + 100
where EmployeeID IN (Select emp.EmployeeID
					 From   Employee as emp
					 Join   Department as dept
					 On     emp.DepartmentID = dept.DepartmentID
					 Where  dept.DepartmentName = 'IT')







-- Print only those employees whose fullname is less than 13 characters
With EmpFullNameCTE As
(
	Select concat(FirstName,LastName) as FullName
	From Employee
)

Select *
From EmpFullNameCTE
Where LEN(FullName) < 13;
