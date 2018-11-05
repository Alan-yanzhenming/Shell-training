#!/bin/bash

/usr/bin/id class1 &> /dev/null
[ $? -eq 0 ] || groupadd class1

for n in `seq -w 01 30`;
   do
      useradd -g class1 std$n
done




##添加一个新组class1，然后添加这个新组30个用户，用户名std*，其中从01到30