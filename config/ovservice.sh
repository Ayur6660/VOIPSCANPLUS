#!/usr/bin/sh
service iptables restart
service mariadb  restart
service php-fpm  restart
service nginx  restart
killall -9 /usr/bin/rtpproxy
/usr/bin/rtpproxy -L 100000 -u root -l  VOIPSCANPLUS_LB_IP  -s udp:localhost:5899 -m 6000 -M 65000
killall -9 /home/VOIPSCANPLUS/LB/sbin/kamailio
/home/VOIPSCANPLUS/LB/sbin/kamailio
/home/VOIPSCANPLUS/bin/fs_cli -x "shutdown"
sleep 10
/home/VOIPSCANPLUS/bin/freeswitch -nc
