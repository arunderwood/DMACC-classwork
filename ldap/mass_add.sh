#!/bin/bash

baseuid=503
rm userx.ldif

cat $1 | ( IFS=, ; while read fname lname mail;
do
baseuid=`expr $baseuid + 1`
./create_userx_ldif.sh userx.ldif $fname $lname $mail $baseuid
cat userx.ldif 
echo -e "\n\n"
done )
