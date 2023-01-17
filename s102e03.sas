Title 'Employee count by department';
proc sql;
	select Department, count(*) as Count
		from SGF2020.employee_information
			group by Department;
quit;
