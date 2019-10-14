#!/usr/bin/env bash
for VAR in item1 item2 item3 ; do
    echo ${VAR}
done

for i in `seq 1 100`; do
    echo ${i}
done

j=0
for i in `seq 1 100`; do
#    j=`expr ${i} + ${j}`
     j=$(($j + $i))
done
echo ${j}