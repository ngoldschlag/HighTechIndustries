/* configuration file for QWI-HT */

/* adjust to where public-use QWI can be found */
%let qwibase=/data/clean/qwipu/state/data.R2016Q3/;
%let schema=4.1-rc2;

/* adjust to where the HT indicators are */
%let htbase=../data;
libname HTBASE "&htbase.";
/* where does intermediate data live */
%let interwrk=/scratch/htqwi;
x "[[ -d &interwrk. ]] || mkdir -p &interwrk.";
libname INTERWRK "&interwrk.";

options sasautos= ( !SASAUTOS "./" );
