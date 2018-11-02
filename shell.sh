#!/bin/bash
n=`ping -c5 180.163.26.39|grep 'packet' |awk -F '%' '{print $1}' |awk '{print $NF}'`
if [ -z "$n" ]
then
    echo "脚本有问题。"
    python mail.py  $m "检测机器存活脚本$0有问题" "获取变量的值为空"
    exit
else
    n1=`echo $n|sed 's/[0-9]//g'`
    if [ -n "$n" ]
    then
        echo "脚本有问题。"
        python mail.py  $m "检测机器存活脚本$0有问题" "获取变量的值不是纯数字"
        exit 
    fi
fi

if 
m=123@qq.com
while :
do
    if [ $n -ge 50 ]
    then
    	python mail.py $m "机器宕机" "丢包率是$n%"
    fi
    sleep 30
done







#题目要求
#设计一个脚本，监控远程的一台机器(假设ip为180.163.26.39)的存活状态，当发现宕机时发一封邮件给你自己。

#核心要点
#ping -c10 180.163.26.39 通过ping来判定对方是否在线
#发邮件脚本 https://coding.net/u/aminglinux/p/aminglinux-book/git/blob/master/D22Z/mail.py

