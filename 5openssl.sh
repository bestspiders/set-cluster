#!/bin/bash
source /etc/profile
until
input=$1
test $input = 6 >/dev/null 2>&1
do
case $input in
1)
#安装openssl环境（1.0.2m
cd /usr/local/src/openssl-fips-2.0.16/
./config
make && make install
cd /usr/local/src/openssl-1.0.2m/
/bin/cp ../zlib-1.2.11/zlib.h .
/bin/cp ../zlib-1.2.11/zconf.h .
./config fips shared zlib-dynamic
make depend
make install
#重命名原来的openssl命令
mv /usr/bin/openssl  /usr/bin/openssl.old
#重命名原来的openssl目录
mv /usr/include/openssl  /usr/include/openssl.old
ln -s /usr/local/ssl/bin/openssl  /usr/bin/openssl
ln -s /usr/local/ssl/include/openssl  /usr/include/openssl
ldconfig -v
openssl version -a
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
