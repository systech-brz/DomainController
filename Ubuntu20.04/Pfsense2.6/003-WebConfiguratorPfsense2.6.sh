Autor: Jensy Gregorio Gomez
Data de criação: 19/02/2022
Data de atualização: 19/02/2022
Versão: 0.01
Testado e homologado no Firewall NG UTM Netgate pfSense 2.5.x


#Primeira etapa: Acessando o pfSense via Navegador (recomendado utilizar o Navegador Firefox)
	01. Acessar o endereço IPv4: http://173.169.73.254
		Sign In
			Username: admin 
			Password: pfsense
			Sign In
		
		pfSense Setup
			Welcome to pfSense® software!
			<Next>
	
		Netgate® Global Support is available 24/7
			<Next>
	
		General Information
			Hostname: firewall
			Domain: systech.brz
			Primary DNS Server: 8.8.8.8
			Secondary DNS Server: 8.8.4.4
			Override DNS: (Disable)
			<Next>
	
		Time Server Information
			Time server hostname: a.st1.ntp.br
			Timezone: America/Sao_Paulo
			<Next>
	
		Configure WAN Interface
			SelectedType: DHCP
			General configuration
				MAC Address: (default)
				MTU: (default)
				MSS: (default)
			RFC1918 Networks
				Block RFC1918 Private Networks: (Disable)
				Block bogon networks: (Disable)
			<Next>
	
		Configure LAN Interface
			LAN IP Address: 173.169.73.254
			Subnet Mask: 24
			<Next>
	
		Set Admin WebGUI Password
			Admin Password: 		News_Password
			Admin Password AGAIN: 	Renew_Password
			<Next>
	
		Reload configuration
			<Reload>
	
		Wizard completed.
			<Finish>

02. Copyright and Trademark Notices.
	<Accept>
	Thank you!
	<Close>