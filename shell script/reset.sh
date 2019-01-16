#!/bin/bash
# 停止Tomcat服务器
/usr/local/share/apache-tomcat-8.0.43/bin/shutdown.sh
# 预防Tomcat服务器没有正确停止 手动结束改进程
pidlist=`ps -ef |grep tomcat |grep -v "grep"|awk '{print $2}'`
kill -9 $pidlist
# 按文件的更改时间进行排序 获取最近的war名
resetEdition=`ls -alt /home/rocky/backup/ |grep ".war" | awk 'NR==1{print $9}'`
# 拷贝一份
cp /home/rocky/backup/$resetEdition /home/rocky/gas-tms.war
# 删除已有的Tomcat下的文件夹
rm -rf /usr/local/share/apache-tomcat-8.0.43/webapps/gas*
# 移动war到Tomcat webapps文件夹下
mv /home/rocky/gas-tms.war /usr/local/share/apache-tomcat-8.0.43/webapps/
# 启动Tomcat服务器
/usr/local/share/apache-tomcat-8.0.43/bin/startup.sh
