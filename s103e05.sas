Title 'Common columns in SASHELP';
proc sql;
	select name, type, length, memname
		from dictionary.columns
			where libname='SASHELP'
				group by name
					having count(name) > 1;
quit;
