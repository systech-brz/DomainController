Primeira etapa: Instalando o DHCP Server via WebManagement App
01. Acessar o WebManagement (recomendado utilizar o navegado Firefox)
		https://173.169.73.1

02. System and Domain Manager
		Username: administrator
		Password: pti@2018

03. Favorites ou Software
		App Center
			Do not show this message again: Yes
				DHCP Server
					Install
						Start Installation
						Manager Installation
						Open

04. Domain
		DHCP Server
			DHCP
				All DHCP Server
					systech.brz 
						Select: 173.168.73.0 - Subnet: <Edit>
							Basic settings
								General DHCP subnet settings
									Subnet address *: 172.169.73.0
									Address prefix length (or Netmask) *: 24
									Broadcast address: 173.169.73.255
									Dynamic address assignment
										First address: 173.169.73.100
										Last address: 173.169.73.253
							<Save>
						Select: 172.16.1.0 - Subnet: <Edit>
							Options
								Options describing the basic features of the LDAP object
									Options
										Allow custom DHCP options: Yes
							Policies
								Properties inherited from policies
									Policy: DHCP DNS 
										Select policy configuration: Default
										Domain name: pti.intra 
										Domain name servers: 172.16.1.10
									Policy: DHCP lease time
										Select policy configuration: CREATE NEW POLICY
											Name *: lease
											Default lease time: 8 hours
											Minimum lease time: 7 hours
											Maximum lease time: 8 hours
										CREATE POLICY
									Policy: DHCP NetBIOS
										Select policy configuration: CREATE NEW POLICY
											Name *: netbios
											NetBIOS name servers: 173.169.73.1
											NetBIOS scope: Default
											NetBIOS node type: 8 H-node: Hybrid - WINS, then broadcast
										CREATE POLICY
									Policy: DHCP statements
										Select policy configuration: CREATE NEW POLICY
											name: statements
											Authoritative: Yes
											Ping check: True
											Server identifier: ptispo01dc01
											Server name: ptispo01dc01
											Add hostnames to leases: True
										CREATE POLICY
								<Save>

05. System
		System Service
			Search: dhcp <Enter>

06. Atualizando o Endereço IPv4 no Microsoft Windows
ipconfig /all 
ipconfig /release
ipconfig /renew
ping google.com

07. Atualizando o Endereço IPv4 no GNU/Linux Mint
Ícone de Conexão de Rede 
	Configurações de Rede 
		Cabeada
			Desativar Rede
			Ativar Rede
Terminal
	ifconfig
	route -n 
	systemd-resolve --status
	ping google.com

08. Login Bash/Shell
		login: root <Enter>
		password: pti@2018 <Enter>
			less /var/lib/dhcp/dhcpd.leases

 