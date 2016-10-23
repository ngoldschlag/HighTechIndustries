%macro create_rename(vars=,schema=,outfile=frag_rename_qwi.sas);

filename rename url "http://lehd.ces.census.gov/data/schema/V&schema./variables_qwi.csv";

proc import file=rename out=qwivars dbms=csv;run;
data _null_;
	file "&outfile." ;
	set qwivars;
	%do i = 1 %to %sysfunc(countw(&vars.));
	if lowcase(Alternate_name) = "%lowcase(%scan(&vars.,&i.))" then 
	put Indicator_Variable " = " Alternate_name ;
	%end;
run;
%mend;


