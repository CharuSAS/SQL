Title 'Tables Containing an ID Column';

proc sql;
	select memname 'Table Names', name
		from dictionary.columns
			where libname='SASHELP' and 
				upcase(name) contains 'ID';
quit;