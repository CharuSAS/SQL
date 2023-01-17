Title 'Employee counts by department in departments with at least 25 employees';
proc sql;
	select Department, count(*) as Count
		from SGF2020.employee_information 
			group by Department
				having Count ge 25
					order by Count desc;
quit;