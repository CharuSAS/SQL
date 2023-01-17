Title ' Is this average salary by gender';
proc sql number;
	select Employee_Gender,
		avg(Salary) as Average
	from SGF2020.employee_information
		where Employee_Term_Date is missing;
quit;
