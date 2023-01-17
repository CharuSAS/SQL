proc sql;
	select Employee_ID, Employee_Gender, Salary
		from SGF2020.employee_information
			order by Employee_ID
				where Employee_Gender='M';
quit;