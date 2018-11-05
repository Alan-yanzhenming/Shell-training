#!/bin/bash


find /123/ -type f -name "*.txt" > /tmp/txt.list
for f in 'cat /tmp/txt.list';
do
   mv $f $f.bak
done

d=`date +%y%m%d%H%M%S`

mkdir /tmp/123_$d

for f in `cat /tmp/txt.list`;
do
   cp $f.bak /tmp/123_$d
done

cd /tmp
tar zcf 123.tar.gz 123_$d/
for f in `cat /tmp/txt.list`;
do
  mv $f.bak $find
done

