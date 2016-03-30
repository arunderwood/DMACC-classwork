#!/bin/bash

baseuid=503

echo "dn: uid=${2:0:1}$3,ou=ldap_users,ou=Groups,dc=bizzaro,dc=com" >> $1
echo "uid: ${2:0:1}$3" >> $1
echo "objectclass: top" >> $1
echo "objectclass: posixAccount" >> $1
echo "objectclass: shadowAccount" >> $1
echo "objectclass: organizationalPerson" >> $1
echo "objectclass: inetOrgPerson" >> $1
echo 'userPassword: {crypt}$1$fIStFN.E$Vhe71xPbxqdBWKDb6KzpP0' >> $1
echo "cn: $2 $3" >> $1
echo "givenName: $2" >> $1
echo "sn: $3" >> $1
echo "mail: $4" >> $1
echo "uidNumber: $5" >> $1
echo "gidNumber: 503" >> $1
echo "loginShell: /bin/bash" >> $1
echo -e "homeDirectory: /home/${2:0:1}$3 \n" >> $1
echo 
