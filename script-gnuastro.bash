asttable catalog-raw.fits -cID,SPECZ,10,11,12,'arith $10 $12 -' --sort=SPECZ \
| asttable  --range=6,3:inf --txtf64format fixed \
| grep -ve' -99.0*0 ' -ve ' 99.0*0 ' > gnuastro-reddest-with-z.txt