#!/bin/bash
source /etc/profile
until
input=$1
test $input = 6 >/dev/null 2>&1
do
case $input in
1)
#安装基础支持环境
cd /usr/local
mkdir apr;mkdir apr-util;mkdir pcre;mkdir zlib
cd /usr/local/src/apr-1.6.3/
./configure --prefix=/usr/local/apr/
make && make install
cd /usr/local/src/apr-util-1.6.1/
./configure --prefix=/usr/local/apr-util/ --with-apr=/usr/local/apr/
make && make install
cd /usr/local/src/pcre-8.41/
./configure --prefix=/usr/local/pcre/
make && make install
cd /usr/local/src/zlib-1.2.11/
./configure --prefix=/usr/local/zlib/
make && make install
ls -l /usr/local/apr/;ls -l /usr/local/apr-util/;ls -l /usr/local/pcre/;ls -l /usr/local/zlib/
exit
;;

2)
ls
exit
;;

3)
ls
exit
;;

4)
ls
exit
;;

5)
ls
exit
;;

6)echo "请输入选择（1-6）"
esac
done
