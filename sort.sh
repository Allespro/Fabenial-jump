#!/bin/bash
SORT=$(sort -nr -t : -k 2,2 HighScore | uniq)
echo "$SORT" > ./swap
SORT=$(head -n 20 swap)
rm swap
echo -n > ./Leaders
while read line 
do
	x=$(( $x + 1 ))
 	echo "$x: ${line}" >> ./Leaders
done <<< "$SORT"

#echo "$SORT"
# > ./Leaders
