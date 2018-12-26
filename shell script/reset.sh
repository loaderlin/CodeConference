#!/bin/bash
/usr/local/share/apache-tomcat-8.0.43/bin/shutdown.sh
pidlist=`ps -ef |grep tomcat |grep -v "grep"|awk '{print $2}'`
kill  $pidlist
kill -9 $pidlist
resetEdition=`ls -alt /home/rocky/backup/ |grep ".war" | awk 'NR==1{print $9}'`
cp /home/rocky/backup/$resetEdition /home/rocky/gas-tms.war
rm -rf /usr/local/share/apache-tomcat-8.0.43/webapps/gas*
mv /home/rocky/gas-tms.war /usr/local/share/apache-tomcat-8.0.43/webapps/
/usr/local/share/apache-tomcat-8.0.43/bin/startup.sh
