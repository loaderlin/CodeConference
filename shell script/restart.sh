#!/bin/bash
pidlist=`ps -ef |grep tomcat |grep -v "grep"|awk '{print $2}'`

cd /app/minitors
sum_jvm_log=$(date  +%Y%m%d_%H%M)_restart.log 
touch $sum_jvm_log
echo "---------------------JMAP------------------------------------------" >> $sum_jvm_log
printf "*************************************************************** \n\n\n\n" >> $sum_jvm_log
jmap -heap  $pidlist >> $sum_jvm_log
printf "\n\n\n\n----------------------JSTAT GC-----------------------------------------\n" >> $sum_jvm_log
printf "*************************************************************** \n\n" >> $sum_jvm_log
jstat -gc $pidlist >> $sum_jvm_log
printf "\n\n\n\n------------------------JSTACK---------------------------------------\n" >> $sum_jvm_log
printf "*************************************************************** \n\n" >> $sum_jvm_log
jstack  $pidlist >> $sum_jvm_log

kill -9 $pidlist
/app/apache-tomcat-8.0.46/bin/startup.sh
