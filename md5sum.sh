#!/bin/bash

if [ "$1" = "create" ]
then

find / -xdev -group md5sum -type f -exec md5sum {} ';' >> /var/log/md5.file.log


elif [ "$1" = "check" ]
then

if [ -f md5sum.temp ]
then
rm md5sum.temp
fi

find / -xdev -group md5sum -type f -exec md5sum {} ';' >> md5sum.temp


diff /var/log/md5.file.log md5sum.temp | grep '>' | logger -p local0.notice -t __MD5SUM_ALERT__


else
echo "when you run this program please pass it either \"check\" or \"create\""
fi
