#!/bin/bash
# version  /home/version
#============
#author: 奚捷, 王鑫
#修改 /etc/security/limists.conf
#修改 /etc/profile
#修改 防火墙
#修改 /var/log/sudo.log
#修改 时间同步
#============
source /etc/profile
until
input=$1
test $input = 6 >/dev/null 2>&1
do
case $input in
1)#优化参数  for redhat
def=`route |grep default|awk '{print$2}'|awk -F "." '{print $1"."$2"."$3".254"}'`
route del default;route add default gw $def
cp /etc/security/limits.conf /etc/security/limits.conf_bak
sleep 1
grep 'hard nproc 65535' /etc/security/limits.conf || echo -e "* soft nofile 65536 \n* hard nofile 65536\n* soft nproc 65535\n* hard nproc 65535" >> /etc/security/limits.conf
grep 'ulimit -n 65536' /etc/profile || echo -e "\nulimit -n 65536" >> /etc/profile
grep 'umask 022' /etc/profile || echo -e "\numask 022" >> /etc/profile
sleep 1
echo "export PROMPT_COMMAND='{ h=\`history 1\`;w=\`who am i\`;echo -e \$(date \"+%Y-%m-%d %H:%M:%S\") ---\$w ---\$h;} >> /var/log/sudo.log'" >> /etc/profile
sleep 1
source /etc/profile
#关闭防火墙
#redhat
service iptables stop
chkconfig --level 123456 iptables off
setenforce 0
sed -i '/^SELINUX/{s/enforcing/disabled/g}' /etc/selinux/config

#优化连接
cp -rf /etc/sysctl.conf /etc/sysctl.conf_bak
sleep 1

cat >>/etc/sysctl.conf<<EOF
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_keepalive_time = 1200
net.ipv4.ip_local_port_range = 10240    65000
net.ipv4.tcp_max_tw_buckets = 5000
net.ipv4.tcp_max_syn_backlog = 8192
fs.file-max=655350
net.ipv4.tcp_timestamps = 0
EOF
sleep 1
source /etc/profile
sysctl -p
touch /var/log/sudo.log
chmod 775 /var/log/sudo.log
service ntpd stop
/nas/nas_log/shell/syncdate.sh
exit
;;

2)#优化参数 for centos
#修改 limits.conf
tname=`date +%Y-%m-%dT%H%M%S`
cp /etc/security/limits.conf /etc/security/limits.conf_bak$tname
sleep 1
grep 'hard nproc 65535' /etc/security/limits.conf || echo -e "* soft nofile 65536 \n* hard nofile 65536\n* soft nproc 65535\n* hard nproc 65535" >> /etc/security/limits.conf

#修改 /etc/profile 
if_grep=`grep "ulimit -n 65536" /etc/profile`
if [[ $if_grep != "ulimit -n 65536" ]];
then
grep 'ulimit -n 65536' /etc/profile || echo -e "\nulimit -n 65536" >> /etc/profile
#grep 'umask 022' /etc/profile || echo -e "\numask 022" >> /etc/profile
echo -e "\numask 022" >> /etc/profile
sleep 1
grep "export PROMPT_COMMAND=" /etc/profile || echo -e "export PROMPT_COMMAND='{ h=\`history 1\`;w=\`who am i\`;echo -e \$(date \"+%Y-%m-%d %H:%M:%S\") ---\$w ---\$h;} >> /var/log/sudo.log'">> /etc/profile
sleep 1
source /etc/profile
else
echo "has add setnce to /etc/profile, so dont do actoins"
fi 

#关闭防火墙
#centos
# systemctl stop firewalld.service #停止firewall
# systemctl disable firewalld.service #禁止firewall开机启动

setenforce 0
sed -i '/^SELINUX/{s/enforcing/disabled/g}' /etc/selinux/config

#优化连接
cp -rf /etc/sysctl.conf /etc/sysctl.conf_bak$tname
sleep 1
net_ipv4=`grep "net.ipv4.tcp_syncookies = 1" /etc/sysctl.conf`
if [[ $net_ipv4 != "net.ipv4.tcp_syncookies = 1" ]];
then
cat >>/etc/sysctl.conf<<EOF
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_keepalive_time = 1200
net.ipv4.ip_local_port_range = 10240    65000
net.ipv4.tcp_max_tw_buckets = 5000
net.ipv4.tcp_max_syn_backlog = 8192
fs.file-max=655350
net.ipv4.tcp_timestamps = 0
EOF
else
echo "net_ipv4 has add"
fi
sleep 1
source /etc/profile
sysctl -p

# 修改 /var/log/sudo.log 
touch /var/log/sudo.log
chmod 775 /var/log/sudo.log

#2017.12.12注释  修改 时间同步
# service ntpd stop
# /nas/nas_log/shell/syncdate.sh 
exit
;;

3)#优化参数 for sus 
cp /etc/security/limits.conf /etc/security/limits.conf_bak
sleep 1
grep 'hard nproc 65535' /etc/security/limits.conf || echo -e "* soft nofile 65536 \n* hard nofile 65536\n* soft nproc 65535\n* hard nproc 65535" >> /etc/security/limits.conf
grep 'ulimit -n 65536' /etc/profile || echo -e "\nulimit -n 65536" >> /etc/profile
grep 'umask 022' /etc/profile || echo -e "\numask 022" >> /etc/profile
sleep 1
grep "export PROMPT_COMMAND=" /etc/profile || echo "export PROMPT_COMMAND='{ h=\`history 1\`;w=\`who am i\`;echo -e \$(date \"+%Y-%m-%d %H:%M:%S\") ---\$w ---\$h;} >> /var/log/sudo.log'" >> /etc/profile
sleep 1
source /etc/profile
#关闭防火墙
#suse
rcSuSEfirewall2 stop
chkconfig --level 2345 SuSEfirewall2_init off

setenforce 0
sed -i '/^SELINUX/{s/enforcing/disabled/g}' /etc/selinux/config

#优化连接
cp -rf /etc/sysctl.conf /etc/sysctl.conf_bak
sleep 1
net_ipv4=`grep "net.ipv4.tcp_syncookies = 1" /etc/sysctl.conf`
sleep 1
source /etc/profile
sysctl -p
touch /var/log/sudo.log
chmod 775 /var/log/sudo.log
service ntpd stop
/nas/nas_log/shell/syncdate.sh
exit
;;

4)
useradd version
echo V\#wdtke\!33 | passwd  --stdin version
exit
;;

5)ls
exit
;;

6)echo "请输入选择（1-6）"
esac
done
