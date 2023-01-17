proc sql noexec;
	select Employee_ID, Employee_Gender, Salary
		from SGF2020.employee_information
			where Employee_Gender='F'
				order by Salary desc;
quit;