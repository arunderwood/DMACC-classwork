#!/bin/bash

#Number of times to test
testnum=10

rm timeresult*


for (( i=testnum;i>=0;--i ))                                                                                                 
do

/usr/bin/time -f "%e" -a -o timeresult1 ldapsearch -x -b 'dc=bizzaro,dc=com' 'cn=emp_41' >> /dev/null

done



for (( i=testnum;i>=0;--i ))                                                                                                 
do

/usr/bin/time -f "%e" -a -o timeresult2 ldapsearch -x -b 'dc=bizzaro,dc=com' 'cn=emp_4100' >> /dev/null

done



for (( i=testnum;i>=0;--i ))                                                                                                 
do

/usr/bin/time -f "%e" -a -o timeresult3 ldapsearch -x -b 'dc=bizzaro,dc=com' 'cn=emp_4241' >> /dev/null

done



for (( i=testnum;i>=0;--i ))                                                                                                 
do

/usr/bin/time -f "%e" -a -o timeresult4 ldapsearch -x -b 'dc=bizzaro,dc=com' 'cn=emp_12345' >> /dev/null

done


(
IFS=$'\n'

echo "Average time for emp_41"
awk ' { sum += $1; n++ } END { print sum/n }' timeresult1
echo ""

echo "Average time for emp_4100"
awk ' { sum += $1; n++ } END { print sum/n }' timeresult2
echo ""

echo "Average time for emp_4241"
awk ' { sum += $1; n++ } END { print sum/n }' timeresult3
echo ""

echo "Average time for emp_12345"
awk ' { sum += $1; n++ } END { print sum/n }' timeresult4
echo ""

)
