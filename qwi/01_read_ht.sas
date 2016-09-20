/* run some basic stats by high-tech industries */
%include "config.sas"/source2;

proc import datafile="&htbase./ht_stem_industries.csv" out=INTERWRK.htindustries dbms=csv replace;
run;
	
proc print data=INTERWRK.htindustries;
run;

