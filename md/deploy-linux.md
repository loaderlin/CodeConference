## 创建目录
```sh
mkdir -p /app/edi/backup
mkdir /app/share
mkdir /app/backup
mkdir /app/jdk
```

## 下载部分安装包
```sh
yum -y install vim unzip net-tools lsof iptables-services
```

## 解压包
```
cd /app
unzip apache-tomcat-8.0.45.zip 

chmod 755 /app/apache-tomcat-8.0.45/bin/startup.sh
chmod 755 /app/apache-tomcat-8.0.45/bin/shutdown.sh
chmod 755 /app/apache-tomcat-8.0.45/bin/catalina.sh

cd /app/jdk/
tar -zxvf jdk-8u131-linux-x64.tar.gz 
```

## 配置JDK环境
```sh
JAVA_HOME=/app/jdk/jdk1.8.0_131
CLASSPATH=.:$JAVA_HOME/lib.tools.jar
PATH=$JAVA_HOME/bin:$PATH
export JAVA_HOME CLASSPATH PATH
```
--- 
```sh
vim /etc/profile
source /etc/profile
java -version
```
## 设置防火墙

```sh
vim /etc/sysconfig/iptables

-A INPUT -p tcp -m state --state NEW -m tcp --dport 8080 -j ACCEPT

service iptables restart

iptables -L -n
```
## 启动 TMS

/app/deploy.sh

## 启动 EDI

/app/edi-deploy.sh