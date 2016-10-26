#!/bin/bash
wget -O /opt/xtables-addons-2.10.tar.xz http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons/xtables-addons-2.10.tar.xz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fxtables-addons%2Ffiles%2F&ts=1477488107&use_mirror=iweb
cd /opt
tar -xf xtables-addons-2.10.tar.xz
yum -y install gcc kernel-devel iptables-devel perl-Text-CSV_XS automake
cd /opt/xtables-addons-2.10
./configure
make
make install
cd /opt/xtables-addons-2.10/geoip
./xt_geoip_dl
./xt_geoip_build GeoIPCountryWhois.csv
test -d /usr/share/xt_geoip/ || mkdir -p /usr/share/xt_geoip/
cp -r {BE,LE} /usr/share/xt_geoip/
#yum -y remove   gcc.noarch iptables-devel.x86_64 kernel-devel.x86_64 cpp48.x86_64 gcc48.x86_64 glibc-devel.x86_64 glibc-headers.x86_64 hardlink.x86_64 kernel-headers.x86_64 libgomp.x86_64 libmpc.x86_64 mpfr.x86_64 
