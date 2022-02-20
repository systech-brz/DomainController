#!/usr/dev/bin bash

#ABRIR O PFSENSE E CREAR UN ACESO NAT PARA CONECTAR AL SERVIDOR PELO SSH 

Criando os apelidos no pfSense
Firewall
	Aliases
		IP
			+ADD
				Properties
					Name: ControladorDominio
					Description: Controlador de Dominio Samba 4
					Type: Host(s)
				Host(s)
					IP or FQDN: 172.169.73.1  		- Description: 	IP 
					IP or FQDN: DC-01  				- Description: 	Hostname
					IP or FQDN: DC-01.systech.brz	- Description: 	FQDN 
			Save
	Apply Changes

Criando as regras de NAT no pfSense
Firewall
	NAT
		Port Forward
			ADD
				Edit Redirect Entry
					Disabled: Off
					No RDR(NOT): Off
					Interface: WAN
					Address Family: IPv4
					Protocol: TCP
					Source: Default
					Destination
						Invert match: Off
						WAN Address
					Destination port range: 
						From port: SSH
						Custom: Default
						To port: SSH
						Custom: Default
					Redirect target IP:
						Type: Single host
						Address: ucsunivention
					Redirect target port: 
						Port: SSH
						Custom: Default
					Description: Redirecionamento da Porta 22 SSH do ControladorDominio Samba4 no Debian11
					No XMLRPC Sync: Off
					NAT reflection: Use system default
					Filter rule association: Add association filter rule
			Save
		Apply Changes

		+Separator
			Enter a description: Regras de NAT do Servidor UCS Univention - Color: Blue
		Save

Configurando as regras de Firewall na Interface WAN do pfSense
Firewall
