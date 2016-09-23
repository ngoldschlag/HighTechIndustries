/* run some basic stats by high-tech industries */
%include "config.sas"/source2;

proc import datafile="&htbase./ht_stem_industries.csv" out=INTERWRK.htindustries dbms=csv replace;
run;
	

data INTERWRK.htindustries;
	set INTERWRK.htindustries;
	length industry $ 5;
	industry=put(naics,$4.);
run;

/* crosswalk for select industries */
data xwalk;
	input naics naics2007 naics2012;
	cards;;
5161 5191 5191
5173 5179 5179
5181 5179 5179
;;
run;



proc sort data=INTERWRK.htindustries;
by naics;
run;

proc print data=INTERWRK.htindustries;
run;

