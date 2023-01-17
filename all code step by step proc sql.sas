%let path =C:\Users\cancxs\OneDrive - SAS\Home\user groups\2023 UG\Umich 17Jan23 Step by Step SQL Procedure\data;
Libname Umich "&path";

*1. PROC SQL Syntax order - 2 things;

proc sql;
	select Employee_ID, Employee_Gender, Salary
		from Umich.employee_information;
quit;

proc sql;
	select Employee_ID, Employee_Gender, Salary
		from Umich.employee_information
			where Employee_Gender='F'
				order by Salary desc;
quit;

/*why doesn't this query work?*/
proc sql;
	select Employee_ID, Employee_Gender, Salary
		from Umich.employee_information
			order by Employee_ID
				where Employee_Gender='M';
quit;

/*fixed*/
proc sql;
	select Employee_ID, Employee_Gender, Salary
		from Umich.employee_information
			where Employee_Gender='M'
			   order by Employee_ID;	
quit;

/*2. Summarizing data*/

Title ' Is this average salary by gender?';
proc sql number;
	select Employee_Gender,
		avg(Salary) as Average
	from Umich.employee_information
		where Employee_Term_Date is missing;
quit;

Title "Average Salary by Gender";
proc sql;
	select Employee_Gender as Gender, 
		avg(Salary) as Average
	from Umich.employee_information 
		where Employee_Term_Date is missing
			group by Employee_Gender;
quit;

Title 'Employee count by department';
proc sql;
	select Department, count(*) as Count
		from Umich.employee_information
			group by Department;
quit;

Title 'Employee counts by department in departments with at least 25 employees';
proc sql;
	select Department, count(*) as Count
		from Umich.employee_information 
			group by Department
				having Count ge 25
					order by Count desc;
quit;

title "Manager-to-Employee Ratios";
proc sql;
	select Department,
		sum((find(Job_Title,"manager","i")>0))
	as Managers,
		sum((find(Job_Title,"manager","i")=0))
	as Employees,
		calculated Managers/calculated Employees
		"M/E Ratio" format=percent8.1
	from Umich.employee_information
		group by Department;
quit;


/*3 Know thy data - dictionary tables*/

proc sql;
	describe table dictionary.tables;
quit;


title 'Tables in the SASHELP Library';
proc sql;
	select memname 'Table Name',nobs,nvar,crdate
		from dictionary.tables
			where libname='SASHELP';
quit;

Title 'Columns in the sashelp.cars Table';
proc sql;
	select Name,Type,Length
		from dictionary.columns
			where libname='SASHELP'
				and memname='CARS';
quit;

Title 'Tables Containing an ID Column';
proc sql;
	select memname 'Table Names', name
		from dictionary.columns
			where libname='SASHELP' and 
				upcase(name) contains 'ID';
quit;

Title 'Common columns in SASHELP';
proc sql;
	select name, type, length, memname
		from dictionary.columns
			where libname='SASHELP'
				group by name
					having count(name) > 1;
quit;

/*4 Joins*/

title 'Combining data from multiple tables';
proc sql;
	select *   
		from Umich.customers, Umich.transactions;
quit;

Title 'Inner Join';
proc sql;
	select * 
		from Umich.customers, Umich.transactions
			where customers.ID=
				transactions.ID;
quit;

Title 'Qualifying column name in the SELECT';
proc sql;
	select customers.ID, Name, Action, Amount 
		from Umich.customers, Umich.transactions
			where customers.ID=transactions.ID;
quit;

Title 'Abbreviated code using Table Alias';
proc sql;
	select c.ID, Name, Action, Amount 
		from Umich.customers as c, Umich.transactions as t
			where c.ID=t.ID;
quit;

/*Self join/Reflexive Join*/
Title 'Names of Employees and their Managers';
proc sql;
	select e.Employee_ID "Employee ID", 
		e.Employee_Name "Employee Name",
		m.Employee_ID "Manager ID",
		m.Employee_Name "Manager Name",
		e.Country
	from Umich.employee_addresses as e,
		Umich.employee_addresses as m,
		Umich.employee_organization as o
	where e.Employee_ID=o.Employee_ID and
		o.Manager_ID=m.Employee_ID and 
		Department contains 'Sales'
	order by Country,4,1;
quit;



