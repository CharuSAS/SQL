title 'Combining data from multiple tables';
proc sql;
	select *   
		from SGF2020.customers, SGF2020.transactions;
quit;
