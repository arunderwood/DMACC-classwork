#!/bin/bash

oldip="161.210.253.1"
newip="161.210.253.234"
counter=0

find /home/andrewu/homebash/bash/fakeetc/etc -name *.conf -type f > tempfile.temp
exec 0<tempfile.temp
while read name

do 

grep -l $oldip $name
if [ $? -eq 0 ]
then
let ++counter
sed -i s/$oldip/$newip/g $name
fi
done
echo $counter files were changed.
