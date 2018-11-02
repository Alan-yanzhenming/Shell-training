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




#!/usr/bin/env python
#-*- coding: UTF-8 -*-
import os,sys
reload(sys)
sys.setdefaultencoding('utf8')
import getopt
import smtplib
from email.MIMEText import MIMEText
from email.MIMEMultipart import MIMEMultipart
from  subprocess import *

def sendqqmail(username,password,mailfrom,mailto,subject,content):
    gserver = 'smtp.qq.com'
    gport = 25

    try:
        # msg = MIMEText(unicode(content).encode('utf-8')) //如果发送的邮件有乱码，可以尝试把这行改成如下：
        msg = MIMEText(content,'plan','utf-8') 
        msg['from'] = mailfrom
        msg['to'] = mailto
        msg['Reply-To'] = mailfrom
        msg['Subject'] = subject

        smtp = smtplib.SMTP(gserver, gport)
        smtp.set_debuglevel(0)
        smtp.ehlo()
        smtp.login(username,password)

        smtp.sendmail(mailfrom, mailto, msg.as_string())
        smtp.close()
    except Exception,err:
        print "Send mail failed. Error: %s" % err


def main():
    to=sys.argv[1]
    subject=sys.argv[2]
    content=sys.argv[3]
##定义QQ邮箱的账号和密码，你需要修改成你自己的账号和密码（请不要把真实的用户名和密码放到网上公开，否则你会死的很惨）
    sendqqmail('1234567@qq.com','aaaaaaaaaa','1234567@qq.com',to,subject,content)

if __name__ == "__main__":
    main()
    
    
#####脚本使用说明######
#1. 首先定义好脚本中的邮箱账号和密码
#2. 脚本执行命令为：python mail.py 目标邮箱 "邮件主题" "邮件内容"






#题目要求
#设计一个脚本，监控远程的一台机器(假设ip为180.163.26.39)的存活状态，当发现宕机时发一封邮件给你自己。

#核心要点
#ping -c10 180.163.26.39 通过ping来判定对方是否在线
#发邮件脚本 https://coding.net/u/aminglinux/p/aminglinux-book/git/blob/master/D22Z/mail.py

