/*PhoneNumber1 is `char` and 
PhoneNumber2 is `num`
and the formats need 
to be converted for 
the query to work.
*/
proc contents data=work.grantaguinaldo;
run;

proc sql;
Create table assignment02 as
    select CustomerID, PhoneNumber1, input(PhoneNumber1, best12.) as PhoneNumber1Num,
	length(compress(put(PhoneNumber1,$32.))) as PhoneNumber1Len,
	PhoneNumber2,	
	length(compress(put(PhoneNumber2, 32.))) as PhoneNumber2Len,
	(CASE
		WHEN calculated PhoneNumber1Len = 10 THEN calculated PhoneNumber1Num
		WHEN calculated PhoneNumber2Len = 10 THEN PhoneNumber2  
		ELSE 9999999999
		/*9999999999 Means 
		that there is no 
		valid phone number 
		in the data since 
		neither Number 1 or 
		Number 2 contains 10 digits*/ 
	 END) AS CallNumber
from work.grantaguinaldo;
quit;
run;
/*Print Final Table*/
title "BI/Data Advisor Assignment 02 Final Table (Phone Numbers)";
proc print data=work.assignment02;
run;


proc sql;
Create table test as
    select *
from work.grantaguinaldo;
quit;
run;

proc print data=work.test; run;
