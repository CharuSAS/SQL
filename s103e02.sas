title 'Tables in the SASHELP Library';

proc sql;
	select memname 'Table Name',nobs,nvar,crdate
		from dictionary.tables
			where libname='SASHELP';
quit;