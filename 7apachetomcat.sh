#!/bin/bash
source /etc/profile
until
input=$1
test $input = 7 >/dev/null 2>&1
do
case $input in
1)
#安装apache和tomcat
cd /usr/local
mkdir apache2
chmod 775 apache2
cd /usr/local/src/httpd-2.4.29/
./configure --prefix=/usr/local/apache2 --with-mpm=prefork --enable-cache --enable-disk-cache --enable-mem-cache --enable-file-cache --enable-nonportable-atomics --enable-mods-shared=most --enable-so --enable-rewrite --enable-ssl  --without-hardening --with-zlib=/usr/local/zlib/ --with-apr=/usr/local/apr/ --with-apr-util=/usr/local/apr-util/ --with-ssl=/usr/local/ssl/ --with-pcre=/usr/local/pcre/
make && make install
cd /usr/local/src
mv apache-tomcat-8.5.23 ../tomcat
ln -s /usr/local/apache2/ /apache2
ln -s /usr/local/tomcat/ /tomcat
cd /usr/local/src/tomcat-connectors-1.2.42-src/native/
./configure --with-apxs=/usr/local/apache2/bin/apxs
make && make install
cd /usr/local/src/cronolog-1.6.2/
./configure
make && make install
/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/httpd.conf /apache2/conf/
/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/mod_jk.conf /apache2/conf/
/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/workers.properties /apache2/conf/
/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/httpd-mpm.conf /apache2/conf/extra/
/bin/cp /nas/nas_log/xijie/sh/one/tomcat-8.5.23/catalina.sh /tomcat/bin/
/tomcat/bin/startup.sh
sleep 30
netstat -anpl|grep 8009
/apache2/bin/apachectl start
sleep 3
ps -ef |grep http
curl -o /dev/null -s -w %{http_code} http://localhost/index.jsp
ls -l /tomcat/logs
ls -l /apache2/logs
exit
;;

2)
#安装apache和tomcat
cd /usr/local
mkdir apache2
chmod 775 apache2
cd /usr/local/src/httpd-2.4.29/
./configure --prefix=/usr/local/apache2 --with-mpm=prefork --enable-cache --enable-disk-cache --enable-mem-cache --enable-file-cache --enable-nonportable-atomics --enable-mods-shared=most --enable-so --enable-rewrite --enable-ssl  --without-hardening --with-zlib=/usr/local/zlib/ --with-apr=/usr/local/apr/ --with-apr-util=/usr/local/apr-util/ --with-ssl=/usr/local/ssl/ --with-pcre=/usr/local/pcre/
make && make install
cd /usr/local/src
mv apache-tomcat-7.0.82 ../tomcat
ln -s /usr/local/apache2/ /apache2
ln -s /usr/local/tomcat/ /tomcat
cd /usr/local/src/tomcat-connectors-1.2.42-src/native/
./configure --with-apxs=/usr/local/apache2/bin/apxs
make && make install
cd /usr/local/src/cronolog-1.6.2/
./configure
make && make install
/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/httpd.conf /apache2/conf/
/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/mod_jk.conf /apache2/conf/
/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/workers.properties /apache2/conf/
/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/httpd-mpm.conf /apache2/conf/extra/
/bin/cp /nas/nas_log/xijie/sh/one/tomcat-7.0.82/catalina.sh /tomcat/bin/
/tomcat/bin/startup.sh
sleep 30
netstat -anpl|grep 8009
/apache2/bin/apachectl start
sleep 3
ps -ef |grep http
curl -o /dev/null -s -w %{http_code} http://localhost/index.jsp
ls -l /tomcat/logs
ls -l /apache2/logs
exit
;;

3)
#安装apache和tomcat
cd /usr/local
mkdir apache2
chmod 775 apache2
cd /usr/local/src/httpd-2.4.29/
./configure --prefix=/usr/local/apache2 --with-mpm=prefork --enable-cache --enable-disk-cache --enable-mem-cache --enable-file-cache --enable-nonportable-atomics --enable-mods-shared=most --enable-so --enable-rewrite --enable-ssl  --without-hardening --with-zlib=/usr/local/zlib/ --with-apr=/usr/local/apr/ --with-apr-util=/usr/local/apr-util/ --with-ssl=/usr/local/ssl/ --with-pcre=/usr/local/pcre/
make && make install
cd /usr/local/src
mv apache-tomcat-6.0.53 ../tomcat
ln -s /usr/local/apache2/ /apache2
ln -s /usr/local/tomcat/ /tomcat
cd /usr/local/src/tomcat-connectors-1.2.42-src/native/
./configure --with-apxs=/usr/local/apache2/bin/apxs
make && make install
cd /usr/local/src/cronolog-1.6.2/
./configure
make && make install
/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/httpd.conf /apache2/conf/
/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/mod_jk.conf /apache2/conf/
/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/workers.properties /apache2/conf/
/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/httpd-mpm.conf /apache2/conf/extra/
#/bin/cp /nas/nas_log/xijie/sh/one/tomcat-7.0.82/catalina.sh /tomcat/bin/
/tomcat/bin/startup.sh
sleep 30
netstat -anpl|grep 8009
/apache2/bin/apachectl start
sleep 3
ps -ef |grep http
curl -o /dev/null -s -w %{http_code} http://localhost/index.jsp
ls -l /tomcat/logs
ls -l /apache2/logs
exit
;;

4)
#安装apache和tomcat
cd /usr/local
mkdir apache2
chmod 775 apache2
cd /usr/local/src/httpd-2.2.34/
./configure --prefix=/usr/local/apache2 --with-mpm=prefork --enable-cache --enable-disk-cache --enable-mem-cache --enable-file-cache --enable-nonportable-atomics --enable-mods-shared=most --enable-so --enable-rewrite --enable-ssl  --without-hardening --with-zlib=/usr/local/zlib/ --with-apr=/usr/local/apr/ --with-apr-util=/usr/local/apr-util/ --with-ssl=/usr/local/ssl/ --with-pcre=/usr/local/pcre/
make && make install
cd /usr/local/src
mv apache-tomcat-6.0.53 ../tomcat
ln -s /usr/local/apache2/ /apache2
ln -s /usr/local/tomcat/ /tomcat
cd /usr/local/src/tomcat-connectors-1.2.42-src/native/
./configure --with-apxs=/usr/local/apache2/bin/apxs
make && make install
cd /usr/local/src/cronolog-1.6.2/
./configure
make && make install
#/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/httpd.conf /apache2/conf/
#/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/mod_jk.conf /apache2/conf/
#/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/workers.properties /apache2/conf/
#/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/httpd-mpm.conf /apache2/conf/extra/
#/bin/cp /nas/nas_log/xijie/sh/one/tomcat-7.0.82/catalina.sh /tomcat/bin/
/tomcat/bin/startup.sh
sleep 30
netstat -anpl|grep 8009
/apache2/bin/apachectl start
sleep 3
ps -ef |grep http
curl -o /dev/null -s -w %{http_code} http://localhost/index.jsp
ls -l /tomcat/logs
ls -l /apache2/logs
exit
;;

5)
#安装apache和tomcat
cd /usr/local
mkdir apache
chmod 775 apache
cd /usr/local/src/httpd-2.4.29/
./configure --prefix=/usr/local/apache --with-mpm=prefork --enable-cache --enable-disk-cache --enable-mem-cache --enable-file-cache --enable-nonportable-atomics --enable-mods-shared=most --enable-so --enable-rewrite --enable-ssl  --without-hardening --with-zlib=/usr/local/zlib/ --with-apr=/usr/local/apr/ --with-apr-util=/usr/local/apr-util/ --with-ssl=/usr/local/ssl/ --with-pcre=/usr/local/pcre/
make && make install
cd /usr/local/src
mv apache-tomcat-7.0.82 ../tomcat
ln -s /usr/local/apache/ /apache2
ln -s /usr/local/tomcat/ /tomcat
cd /usr/local/src/tomcat-connectors-1.2.42-src/native/
./configure --with-apxs=/usr/local/apache/bin/apxs
make && make install
cd /usr/local/src/cronolog-1.6.2/
./configure
make && make install
#/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/httpd.conf /apache2/conf/
#/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/mod_jk.conf /apache2/conf/
#/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/workers.properties /apache2/conf/
#/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/httpd-mpm.conf /apache2/conf/extra/
/bin/cp /nas/nas_log/xijie/sh/one/tomcat-7.0.82/catalina.sh /tomcat/bin/
/tomcat/bin/startup.sh
sleep 30
netstat -anpl|grep 8009
/apache2/bin/apachectl start
sleep 3
ps -ef |grep http
curl -o /dev/null -s -w %{http_code} http://localhost/index.jsp
ls -l /tomcat/logs
ls -l /apache2/logs
exit
;;

6)
#安装apache和tomcat
cd /usr/local
mkdir apache
chmod 775 apache
cd /usr/local/src/httpd-2.4.29/
./configure --prefix=/usr/local/apache --with-mpm=prefork --enable-cache --enable-disk-cache --enable-mem-cache --enable-file-cache --enable-nonportable-atomics --enable-mods-shared=most --enable-so --enable-rewrite --enable-ssl  --without-hardening --with-zlib=/usr/local/zlib/ --with-apr=/usr/local/apr/ --with-apr-util=/usr/local/apr-util/ --with-ssl=/usr/local/ssl/ --with-pcre=/usr/local/pcre/
make && make install
cd /usr/local/src
mv apache-tomcat-6.0.53 ../tomcat
ln -s /usr/local/apache/ /apache2
ln -s /usr/local/tomcat/ /tomcat
cd /usr/local/src/tomcat-connectors-1.2.42-src/native/
./configure --with-apxs=/usr/local/apache/bin/apxs
make && make install
cd /usr/local/src/cronolog-1.6.2/
./configure
make && make install
#/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/httpd.conf /apache2/conf/
#/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/mod_jk.conf /apache2/conf/
#/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/workers.properties /apache2/conf/
#/bin/cp /nas/nas_log/xijie/sh/one/apache-2.4.29/httpd-mpm.conf /apache2/conf/extra/
#/bin/cp /nas/nas_log/xijie/sh/one/tomcat-7.0.82/catalina.sh /tomcat/bin/
/tomcat/bin/startup.sh
sleep 30
netstat -anpl|grep 8009
/apache2/bin/apachectl start
sleep 3
ps -ef |grep http
curl -o /dev/null -s -w %{http_code} http://localhost/index.jsp
ls -l /tomcat/logs
ls -l /apache2/logs
exit
;;

7)echo "请输入选择（1-6）"
esac
done
