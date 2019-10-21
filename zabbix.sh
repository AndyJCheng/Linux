#!/usr/bin/env bash
# https://blog.51cto.com/13659253/2165146
yum install -y httpd
systemctl start httd.service
yum install -y php php-mysql
rpm -ivh http://repo.zabbix.com/zabbix/4.3/rhel/7/x86_64/zabbix-release-4.3-1.el7.noarch.rpm
yum install -y zabbix-server-mysql zabbix-get zabbix-web zabbix-web-mysql zabbix-agent zabbix-sender
cd /usr/share/doc/zabbix-server-mysql-4.4.0/
gunzip create.sql.gz
mysql -uzabbix -p
source create.sql
vim zabbix_server.conf
DBName=zabbix        #访问数据库名称
DBUser=zabbix        #zabbix访问数据库用户
DBPassword=admin123  #配置文件中只需修改本行，zabbix访问数据库密码
systemctl start zabbix-server.service
# agent
yum install -y zabbix-agent
vim zabbix_agentd.conf
Server=192.168.144.113         #zabbix服务器地址
ServerActive=192.168.144.113   #活跃服务器地址
systemctl restart zabbix-agent.service