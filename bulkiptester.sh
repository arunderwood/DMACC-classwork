#!/bin/bash

errorcount=0

cat $1 | ( IFS=, ; while read ip action facillvl;
do

# Skips null length lines
if [ -z $ip ]; then
continue
fi

# Skips comments
if [ ${ip:0:1} == "#" ]; then
continue
fi

if [[ $action == "p" ]]; then
		ping -c1 $ip > /dev/null
		if [ $? == 0 ]; then
			echo "Ping! $ip"
		else
			errror="$ip did not return a ping"
			logger -t $0 -p $facillvl $errror
			echo "No Ping $ip"
		fi

elif [[ $action == "rp" ]]; then
		host $ip > /dev/null
		if [ $? == 0 ]; then
			ping -c1 $ip > /dev/null
			if [ $? == 0 ]; then
				echo "Resolves and pings!" $ip
			else
				errror="$ip resolves but does not return ping"
				logger -t $0 -p $facillvl $errror
				echo "Resolve but no ping $ip"
			fi
		else
			errror="$ip does not resolve or return a ping"
			logger -t $0 -p $facillvl $errror
			echo "No resolve or ping $ip"
		fi
	
		

else
	errror="Invalid Action specified for $ip"
	logger -t $0 -p $facillvl $errror
	echo $errror

fi


done )
