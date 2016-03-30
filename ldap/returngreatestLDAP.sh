#!/bin/bash

bignum=500

ldapsearch -x -b 'dc=bizzaro,dc=com' $1 | grep ^$1 | awk '{ print $2 }' | while read num
do
	if [ $num -gt $bignum ]; then
		bignum=$num
	fi
echo "num - " $num
echo "bignum - " $bignum

done

echo "final bignum - " $bignum
