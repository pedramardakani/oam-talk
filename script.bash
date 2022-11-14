grep -ve'^#' catalog-raw.txt \
| sed -e's/ 99 / nan /g' \
      -e's/ -99 / nan /g' \
      -e's/ 99.0*0 / nan /g' \
      -e's/ -99.0*0 / nan /g' > data.txt

awk '{print $1, $94, $10, $11, $12, $10-$12}' data.txt > magnitudes.txt

awk '$2!="nan" && $6>3' magnitudes.txt | sort -nk2 > reddest-with-z.txt