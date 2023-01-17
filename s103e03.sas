Title 'Columns in the sashelp.cars Table';

proc sql;
	select Name,Type,Length
		from dictionary.columns
			where libname='SASHELP'
				and memname='CARS';
quit;