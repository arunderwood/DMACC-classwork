#!/bin/bash

if [ $# != 1 ]; then
echo "Expected name of LDIF file"
exit
fi

ldapadd -v -x -D "cn=Manager,dc=bizzaro,dc=com" -W -f $1
