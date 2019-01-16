#!/bin/bash
# 停止Tomcat服务器
/usr/local/share/apache-tomcat-8.0.43/bin/shutdown.sh
# 预防Tomcat服务器没有正确停止 手动结束改进程
pidlist=`ps -ef |grep tomcat |grep -v "grep"|awk '{print $2}'`
kill -9 $pidlist
# 备份 拷贝一份webapps下的war到备份文件夹下 myapps是本人修改后指定文件夹下的目录
cp -r  /usr/local/share/apache-tomcat-8.0.43/myapps/gas-tms.war /home/rocky/backup/$(date +%Y%m%d%H%M)-gas-tms.war
# 删除已有的Tomcat下的文件夹
rm -rf /usr/local/share/apache-tomcat-8.0.43/myapps/gas*
# 移动war到Tomcat webapps文件夹下
mv /home/rocky/gas-tms.war /usr/local/share/apache-tomcat-8.0.43/myapps/
# 启动Tomcat服务器
/usr/local/share/apache-tomcat-8.0.43/bin/startup.sh

