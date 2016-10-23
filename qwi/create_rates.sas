%macro create_rates(vars=,schema=,outfile=frag_rates_qwi.sas,alternate=yes);

filename rates url "http://lehd.ces.census.gov/data/schema/V&schema./variables_qwir.csv";

proc import file=rates out=qwirvars dbms=csv;run;
data _null_;
	file "&outfile." ;
	set qwirvars;
	%do i = 1 %to %sysfunc(countw(&vars.));
	  %if ( "&alternate." = "yes" ) %then %do;
	if lowcase(Alternate_name) = "%lowcase(%scan(&vars.,&i.))r" then 
	put Alternate_name " =  %scan(&vars.,&i.)  / " Base ";";
	  %end;
	  %else %do;
	if lowcase(Indicator_Variable) = "%lowcase(%scan(&vars.,&i.))r" then 
	put Indicator_Variable " =  %scan(&vars.,&i.)  / " Base ";";
	  %end;
	%end;
run;
%mend;


