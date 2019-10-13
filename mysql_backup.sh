#!/usr/bin/env bash
bak_dir=/tmp/mysql_backup/'date +%Y-%m-%d_%H:%M:%S'
user=root
password=mysql
database=zabbix
if [[ ! -d ${bak_dir} ]]; then
   mkdir -p ${bak_dir}
fi

mysqldump -u${user} -p${password} --databases ${database} --single-transaction | gzip > ${bak_dir}/zabbix.sql.gz

if [[ $? -eq 0 ]]; then
   echo 'backup successfully'
else
   echo 'backup failed, please check!'
fi
