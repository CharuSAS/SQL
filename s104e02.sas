Title 'Inner Join';
proc sql;
	select * 
		from SGF2020.customers, SGF2020.transactions
			where customers.ID=
				transactions.ID;
quit;
