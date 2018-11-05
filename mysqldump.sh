#!/bin/bash


backdir=/root/mysql_bak

d=`date +%F`

[ -d $backdir ] || mkdir $backdir

mysqldump -uroot --default-character-set=utf8 -p'123456' letang > $d-letang.sql