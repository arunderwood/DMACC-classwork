#!/bin/bash

if [ $# != 3 ]
then
echo "Expected number of buildings, floors, employees; got $@"
echo "Goodbye"
exit
fi

if [ -f BFLusers.ldif ]
then rm BFLusers.ldif
fi
echo "" > BFLusers.ldif

let uid=500
let eid=0

for (( i=1;i<=$1;++i ))
do

(
echo ""
echo dn: ou=building_$i,dc=bizzaro,dc=com
echo ou: building_$i
echo objectClass: top
echo objectClass: organizationalUnit
) >> BFLusers.ldif

for (( ii=1;ii<=$2;++ii ))
do

(
echo ""
echo dn: ou=floor_$ii,ou=building_$i,dc=bizzaro,dc=com
echo ou: floor_$ii
echo objectClass: top
echo objectClass: organizationalUnit
) >> BFLusers.ldif


for (( iii=1;iii<=$3;++iii ))
do

let ++uid
let ++eid


(
echo ""
echo dn: cn=emp_$eid,ou=floor_$ii,ou=building_$i,dc=bizzaro,dc=com
echo changetype: add
echo uid: emp_$eid
echo sn: emp_$eid
echo "objectclass: top"
echo "objectclass: posixAccount"
echo "objectclass: shadowAccount"
echo "objectclass: organizationalPerson"
echo "objectclass: inetOrgPerson"
echo 'userPassword: {crypt}$1$fIStFN.E$Vhe71xPbxqdBWKDb6KzpP0'
echo "cn: emp_$eid"
echo "mail: emp_$eid@bizzaro.com"
echo "uidNumber: $uid"
echo "gidNumber: 503"
echo "loginShell: /bin/bash"
echo "homeDirectory: /home/emp_$eid"
echo
) >> BFLusers.ldif

done
done
done
