#!/bin/bash
/usr/local/share/apache-tomcat-8.0.43/bin/shutdown.sh
pidlist=`ps -ef |grep tomcat |grep -v "grep"|awk '{print $2}'`
kill -9 $pidlist
cp -r  /usr/local/share/apache-tomcat-8.0.43/myapps/gas-tms.war /home/rocky/backup/$(date +%Y%m%d%H%M)-gas-tms.war
rm -rf /usr/local/share/apache-tomcat-8.0.43/myapps/gas*
mv /home/rocky/gas-tms.war /usr/local/share/apache-tomcat-8.0.43/myapps/
/usr/local/share/apache-tomcat-8.0.43/bin/startup.sh

