-- revision

drop table if exists Employees;
drop table if exists Department;
create table Department(
	d_id int Primary Key Identity(1,1),
	d_name varchar(200)

);
create table Employees(
	emp_id int Primary Key Identity(1,1),
	emp_name varchar(100) Constraint checkName Check(emp_name Like '[a-c]%'),
	d_id int Foreign Key References Department(d_id)
);



Select * from Employees;
Select * from Department;

Insert into Department Values
('IT'),
('HR');
Insert into Employees Values
('aaAlil', 1),
('Bhushan', 1),
('Candy', 2);


-- Joins
Select Employees.emp_name,
	   Department.d_name
From   Employees
Join   Department
On     Employees.d_id = Department.d_id;


-- Crud
Update Employees
Set emp_name = 'Black'
Where emp_name = 'aaAlil';

Delete from Employees
Where emp_name = 'Black'


-- Stored Procedures

/*
	Exec spChangeEmployeeName @oldName1 = 'Bhushan',
							  @newName = 'Anchal'
*/

Create Procedure spChangeEmployeeName @oldName varchar(100),
						      @newName varchar(100)
As
Begin
	Update Employees
	Set emp_name = @newName
	Where emp_name = @oldName
End


Alter Procedure spChangeEmployeeName @oldName1 varchar(100),
						      @newName varchar(100)
As
Begin
	Update Employees
	Set emp_name = @newName
	Where emp_name = @oldName1
End