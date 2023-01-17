Title "Average Salary by Gender";
proc sql;
	select Employee_Gender as Gender, 
		avg(Salary) as Average
	from SGF2020.employee_information 
		where Employee_Term_Date is missing
			group by Employee_Gender;
quit;
