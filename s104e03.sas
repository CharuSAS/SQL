Title 'Qualifying column name in the SELECT';
proc sql;
	select customers.ID, Name, Action, Amount 
		from SGF2020.customers, SGF2020.transactions
			where customers.ID=transactions.ID;
quit;
