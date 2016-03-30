#!/bin/bash

grep __SUID_ALERT__ /var/log/messages | mail -s "SUID Alert" root

grep __MD5SUM_ALERT__ /var/log/messages | mail -s "MD5SUM Alert" root
