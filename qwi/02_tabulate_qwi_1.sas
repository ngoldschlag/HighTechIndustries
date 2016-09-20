/* run some basic stats by high-tech industries */
%include "config.sas"/source2;

%let qwivars=;

/* create national view */
options mprint symbolgen;

%mk_qwi_us(states=ca wi fl,qwibase=&qwibase.);
%mk_qwi_us_dataset(view=yes,qwilib=qwi_us,suffix=sa_f_gs_n4_op_u);

