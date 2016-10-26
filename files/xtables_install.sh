#!/bin/bash
KERNEL_VERSION=$(rpm -q kernel | sort -n | tail -1 | awk -F 'l-' ' { print $2 } ')
#curl -s /opt/xtables-addons-2.10.tar.xz http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons/xtables-addons-2.10.tar.xz
wget -O /opt/xtables-addons-2.10.tar.xz http://pilotfiber.dl.sourceforge.net/project/xtables-addons/Xtables-addons/xtables-addons-2.10.tar.xz
cd /opt
cp /opt/xtables-addons-2.10/mconfig /tmp/mconfig
rm -rf /opt/xtables-addons-2.10
tar -xJf xtables-addons-2.10.tar.xz
mv /tmp/mconfig /opt/xtables-addons-2.10
#yum -y install gcc kernel-devel-`uname -r` kernel-headers-`uname -r` iptables-devel perl-Text-CSV_XS automake compat-iptables
cd /opt/xtables-addons-2.10
for x in "./configure --with-kbuild=/lib/modules/$KERNEL_VERSION/build" make 'make install'
do
 if ! ( $x  )
 then
  logger "$x failed disabling iptables on boot"
  chkconfig iptables off
  exit 1
 fi
done
cd /opt/xtables-addons-2.10/geoip
./xt_geoip_dl
./xt_geoip_build GeoIPCountryWhois.csv
test -d /usr/share/xt_geoip/ || mkdir -p /usr/share/xt_geoip/
cp -r {BE,LE} /usr/share/xt_geoip/
#yum -y remove   gcc.noarch iptables-devel.x86_64 kernel-devel.x86_64 cpp48.x86_64 gcc48.x86_64 glibc-devel.x86_64 glibc-headers.x86_64 hardlink.x86_64 kernel-headers.x86_64 libgomp.x86_64 libmpc.x86_64 mpfr.x86_64 
