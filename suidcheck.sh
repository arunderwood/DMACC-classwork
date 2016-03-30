#!/bin/bash

if [ -f suid.set.temp ]
then
rm suid.set.temp
fi

find / -xdev -type f -perm -4000 > suid.set.temp

diff suid.set.ok suid.set.temp | grep '>' | logger -p local4.warning -t __SUID_ALERT__
