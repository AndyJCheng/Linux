#!/usr/bin/env bash

# 比较两个数的大小
num=100
if (( $num > 101 )); then
   echo 'yes'
else
   echo 'no'
fi

# 判断变量的值
a=linux
if [[ "$a" == "aa" ]]; then
   echo 'equal'
else
   echo 'not equal'
fi

#判断变量是否存在
str=aaa
if [[ -n $str ]]; then
   echo 'str exist'
fi

if [[ -z $str ]]; then
   echo 'str is null'
else
echo 'str is not null'
    
fi

# 多个条件测试
score=$1
if [[ $score -eq 100 ]]; then
   echo 'very good'
elif [[ $score -gt 90 ]]; then
   echo 'good'
fi