Title 'Abbreviated code using Table Alias';
proc sql;
	select c.ID, Name, Action, Amount 
		from SGF2020.customers as c, SGF2020.transactions as t
			where c.ID=t.ID;
quit;
