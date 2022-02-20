#!/bin/bash

################################################################
################################################################
####														####
####            CONFIGURANDO  IP STATIC		          		####
####            CONFIGURANDO  ACESSO SSH 	          		####
####            ATUALIZANDO O SISTEMA		          		####
####														####
################################################################
################################################################


ip -br link | awk '{print $1}' 

	cat <<EOF > /etc/network/interfaces
			
			
			# Gerado pelo script Systech.brz -- Soluçoes em TI


			source /etc/network/interfaces.d/*

			auto lo
			iface lo inet loopback

			# The primary network interface
			allow-hotplug ens18
			iface ens18 inet static
			address 173.169.73.1
			netmask 24
			network 173.169.73.0
			gateway 173.169.73.254
EOF

ip add flush dev ens18
ifdown ens18
ifup ens18


apt-get install openssh-server
systemctl enable ssh
systemctl start ssh

echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
	/etc/init.d/ssh restart

#ABRIR O PUTTY
	> IP		192.168.1.110
	> PORTA		22001

	apt update													<ENTER>
	apt -y install bridge-utils ifenslave net-tools vim			<ENTER>
	apt -y upgrade												<ENTER>
	apt dist-upgrade											<ENTER>
	apt full-upgrade											<ENTER>
	apt autoremove											<ENTER>
	apt autoclean 
	


################################################################
################################################################
####														####
####		CONFIGURANDO  ARQUIVOS DE CONFIGURACAO     		####
####            		HOSTNAME 			          		####
####            		HOSTS				          		####
####            		RESOLV.CONF			          		####
####            		NSSWITCH.CONF		          		####
####														####
################################################################
################################################################
#################
	hostname DC-01

#	Arquivo_Hostname () {
cat << EOF > /etc/hostname
# Gerado pelo script Systech.brz -- Soluçoes em TI

DC-01 
EOF


#	Arquivo_Hosts () {
cat << EOF > /etc/hosts
# Gerado pelo script Systech.brz -- Soluçoes em TI

127.0.0.1 localhost localhost.localdomain
173.169.73.1 DC-01.systech.brz DC-01
EOF


hostname -f

#	Arquivo_Resolv_Conf () {
cat << EOF > /etc/resolv.conf
# Gerado pelo script Systech.brz -- Soluçoes em TI

domain systech.brz
search systech.brz
nameserver 173.169.73.254
nameserver 8.8.8.8
EOF

cat << EOF > /etc/nsswitch.conf
# Gerado pelo script Systech.brz -- Soluçoes em TI

passwd:         files systemd winbind
group:          files systemd winbind
shadow:         files
gshadow:        files

hosts:          files dns
networks:       files

protocols:      db files
services:       db files
ethers:         db files
rpc:            db files

netgroup:       nis
EOF

reboot

################################################################
################################################################
####														####
####			INSTALACAO DO SAMBA 4			     		####
####														####
####														####
################################################################
################################################################

export DEBIAN_FRONTEND=noninteractive;apt-get update; apt-get install acl apt-utils attr autoconf bind9utils binutils bison build-essential ccache chrpath curl debhelper dnsutils docbook-xml docbook-xsl flex gcc gdb git glusterfs-common gzip heimdal-multidev hostname htop krb5-config krb5-user lcov libacl1-dev libarchive-dev libattr1-dev libavahi-common-dev libblkid-dev libbsd-dev libcap-dev libcephfs-dev libcups2-dev libdbus-1-dev libglib2.0-dev libgnutls28-dev libgpgme11-dev libicu-dev libjansson-dev libjs-jquery libjson-perl libkrb5-dev libldap2-dev liblmdb-dev libncurses5-dev libpam0g-dev libparse-yapp-perl libpcap-dev libpopt-dev libreadline-dev libsystemd-dev libtasn1-bin libtasn1-dev libunwind-dev lmdb-utils locales lsb-release make mawk mingw-w64 patch perl perl-modules pkg-config procps psmisc python3 python3-cryptography python3-dbg python3-dev python3-dnspython python3-gpg python3-iso8601 python3-markdown python3-matplotlib python3-pexpect python3-pyasn1 rsync sed  tar tree uuid-dev wget xfslibs-dev xsltproc zlib1g-dev -y

wget https://download.samba.org/pub/samba/samba-latest.tar.gz 
tar zxvf samba-latest.tar.gz

cd samba-4.15.5/ 

	./configure --prefix=/opt/samba -j 5										<ENTER>
	make -j 5																	<ENTER>
	make install -j 5															<ENTER>


	export PATH=$PATH:'/opt/samba/bin:/opt/samba/sbin'							<ENTER>
	echo 'export PATH=$PATH:"/opt/samba/bin:/opt/samba/sbin' >> ~/.bashrc		<ENTER>
	echo 'export PATH=$PATH:"/opt/samba/bin:/opt/samba/bin' >> ~/.bashrc		<ENTER>

samba-tool domain provision --realm=systech.brz --use-rfc2307 --domain=systech --dns-backend=SAMBA_INTERNAL --adminpass=Casado#55 --server-role=dc

cp /opt/samba/private/krb5.conf /etc/krb5.conf


################################################################
################################################################
####														####
####            CONFIGURANDO  SAMBA NO BOOT           		####
####														####
################################################################
################################################################

touch /etc/systemd/system/samba-ad-dc.service

cat << EOF > /etc/systemd/system/samba-ad-dc.service
# Gerado pelo script Systech.brz -- Soluçoes em TI

[Unit]
Description=Samba Active Directory Domain Controller
After=network.target remote-fs.target nss-lookup.target
[Service]
Type=forking
ExecStart=/opt/samba/sbin/samba -D
PIDFile=/opt/samba/var/run/samba.pid
[Install]
WantedBy=multi-user.target
EOF

/opt/samba/sbin/samba -i

/opt/samba/sbin/samba

systemctl daemon-reload
systemctl enable samba-ad-dc.service
systemctl start samba-ad-dc.service


smbclient -L localhost -U%

smbclient //localhost/netlogon -UAdministrator -c 'ls'

host -t SRV _ldap._tcp.systech.brz.

host -t SRV _kerberos._udp.systech.brz.

host -t A DC-01.systech.brz.

kinit administrator

klist
