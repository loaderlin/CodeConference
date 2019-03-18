#!/bin/bash
pidlist=`ps -ef |grep tomcat |grep -v "grep"|awk '{print $2}'`
cd /app/minitors
sum_jvm_log=$(date  +%Y%m%d_%H%M).log 
touch $sum_jvm_log
echo "---------------------JMAP------------------------------------------" >> $sum_jvm_log
printf "*************************************************************** \n\n\n\n" >> $sum_jvm_log
/app/jdk/jdk1.8.0_131/bin/jmap -heap  $pidlist >> $sum_jvm_log
printf "\n\n\n\n----------------------JSTAT GC-----------------------------------------\n" >> $sum_jvm_log
printf "*************************************************************** \n\n" >> $sum_jvm_log
/app/jdk/jdk1.8.0_131/bin/jstat -gc $pidlist >> $sum_jvm_log
printf "\n\n\n\n------------------------JSTACK---------------------------------------\n" >> $sum_jvm_log
printf "*************************************************************** \n\n" >> $sum_jvm_log
/app/jdk/jdk1.8.0_131/bin/jstack  $pidlist >> $sum_jvm_log
