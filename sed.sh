#!/usr/bin/env bash
#1 删除行首空格
sed 's/^[[:space:]]//g' filename
#2 在特定行后添加
sed 's/pattern/&\n/g' filename
#3 在行后添加
sed 's/pattern/\n&/g' filename
#4 使用变量替换
sed -e "s/$var1/$var2/g" filename
#5 在第一行前插入文本
sed -i '1 i\ 插入字符' filename
#6 在最后一行后插入文本
sed -i '$ a\ 插入字符串' filename
#7 在匹配行前插入
sed -i '/pattern/i' filename
#8 在匹配行后插入
sed -i '/pattern/a' filename
