#!/usr/bin/env bash
# install
wget http://download.redis.io/releases/redis-5.0.5.tar.gz
tar -zxf redis-5.0.5.tar.gz
cd /opt/redis-5.0.5/;make
cd /opt/redis-5.0.5/src;make install
# start
cd /opt/redis-5.0.5/src
./redis-server ../redis.conf &
# start client
cd /opt/redis-5.0.5/src
./redis-cli
./redis-cli -h ip -p port
# stop
./redis-cli shutdown
# config redis remote connect
vim redis.conf
bind 127.0.0.1 #注释掉
protected-mode no

# command
ping #查看状态
dbsize
select db #选择数据库
flushdb #清空当前数据库

# key
keys pattern, keys *
exists key
expire key second #设置key的存活时间
ttl key
-1
-2
del #删除key

#事务
multi
sadd names andy
sadd names john
smembers names
exec