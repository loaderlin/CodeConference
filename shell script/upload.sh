#!/bin/bash
driver=`ls -al /app/public_space/download/ | grep ".apk" | awk 'NR==1{print $9}'`
existoneapk=`ls -al /app/ | grep ".apk" | awk 'NR==1{print $9}'`
if [ $driver = $existoneapk ]; then
        echo -e "\x1B[01;92m directory /app/$driver exist \x1B[0m"
        cp -r /app/public_space/download/$driver /app/public_space/download/backup/driver/$(date +%Y%m%d%H%M).apk
        rm -rf /app/public_space/download/$driver
        mv /app/$driver /app/public_space/download/
        echo -e "\x1B[01;92m upload $driver success!!! \x1B[0m" 
fi
dispatch=`ls -al /app/public_space/download/ | grep ".apk" | awk 'NR==2{print $9}'`
existtwoapk=`ls -al /app/ | grep ".apk" | awk 'NR==2{print $9}'`
if [[ $dispatch = $existoneapk || $dispatch = $existtwoapk ]]; then
        echo -e "\x1B[01;92m directory /app/$dispatch exist \x1B[0m"
        cp -r /app/public_space/download/$dispatch /app/public_space/download/backup/dispatch/$(date +%Y%m%d%H%M).apk
        rm -rf /app/public_space/download/$dispatch
        mv /app/$dispatch /app/public_space/download/
        echo -e "\x1B[01;92m upload $dispatch success!!! \x1B[0m" 
fi