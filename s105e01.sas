
/* proc sql;*/
/*	SELECT country, YEAR(emphiredate) AS yearhired, COUNT(*) AS numemp */
/*		FROM SGF2020.logicalq*/
/*			WHERE emphiredate >= "1jan2009"d*/
/*				GROUP BY country, yearhired */
/*					HAVING COUNT(*) > 1 */
/*						ORDER BY country , yearhired DESC;*/
/*QUIT;*/
/*%put &sqlobs;*/

*From clause yields 322 rows;
proc sql;
create table sgf2020.logicalq as
	SELECT empid, country,emphiredate
		FROM SGF2020.country;
quit;
%put &sqlobs;

Title 'Filter Rows bases on the where clause - yields 9 rows';
*where clause yields 9 rows;
proc sql;
	SELECT empid, country,emphiredate
		FROM sgf2020.logicalq
			WHERE emphiredate >= '1jan2009'd;
quit;
%put &sqlobs;

*where clause mistake;
proc sql;
	select country, YEAR(emphiredate) AS yearhired 
		FROM SGF2020.logicalq
			WHERE yearhired >= 2009;
quit;

Title 'Group rows based on the group by clause - yields 5 groups';
*group by clause yields 5 groups;
proc sql;
	SELECT country,YEAR(EMPHIREDATE) as yearhired, count(*) as numemp
		FROM sgf2020.logicalq
			WHERE emphiredate >= '1jan2009'd
				GROUP BY country , yearhired;
%put &sqlobs;

Title 'Filter rows based on the Having clause - yields 3 rows';
*Having clause yields 3 rows;
proc sql;
	SELECT country,YEAR(EMPHIREDATE) as yearhired, count(*) as numemp
		FROM sgf2020.logicalq
			WHERE emphiredate >= '1jan2009'd
				GROUP BY country, yearhired
					HAVING count(*) > 1;

%put &sqlobs;

Title 'The Complete Select clause';
*Select clause;
proc sql;
	SELECT country, YEAR(emphiredate) AS yearhired, COUNT(*) AS numemp 
		FROM SGF2020.logicalq
			WHERE emphiredate >= "1jan2009"d 
				GROUP BY country, yearhired
					HAVING COUNT(*) > 1 
						ORDER BY country , yearhired DESC;
QUIT;
%put &sqlobs;

