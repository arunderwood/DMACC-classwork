#!/bin/bash

if [ -f suid.set.temp ]
then
rm suid.set.temp
fi

find / -xdev -type f | while read name

do 

if [ -u $name ]
then
grep -q $name suid.set.ok
if [ $? -ne 0 ]
then 
logger -p local4.warning -t __SUID_ALERT__ $name
fi
fi
done
