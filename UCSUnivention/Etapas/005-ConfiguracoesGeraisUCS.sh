
################################################################
################################################################
####														####
####            		DATA E HORA 		         		####
####														####
################################################################
################################################################

Primeira etapa: Configuração da Data e Hora do Servidor UCS
01. Acessar remotamente o Servidor UCS via SSH
		ssh root@173.169.73.1

02. Verificando a Data, Hora, Locale e Timezone do Servidor UCS
		localectl
		timedatectl
		date

03. Configuração do NTP e Sincronismo de Data e Hora do Servidor UCS
		ucr set timeserver=a.st1.ntp.br timeserver2=a.ntp.br
		systemctl restart ntp.service
		systemctl status ntp.service
		ntpq
			pe (--peers)
			exit
		systemctl stop ntp.service
		ntpdate -s a.st1.ntp.br
		ntpdate
		systemctl start ntp.service
		date
		timedatectl set-ntp yes
		timedatectl

OBSERVAÇÃO: devido o UCS Univention utilizar o sistema Systemd, é necessário fazer a configuração 
do arquivo: timesyncd.conf, no vídeo não foi mostrado essa configuração, segue o procedimento para 
essa configuração utilizando o Terminal e Editor de Texto vim
		vim /etc/systemd/timesyncd.conf
			#Descomentar as linhas 15 e 16 e digitar os servidores do ntp.br
			[Time]
			NTP=a.st1.ntp.br
			FallbackNTP=a.ntp.br
		reboot

Segunda etapa: Configurações Gerais do Servidor UCS
01. Acessar o WebManagement (recomendado utilizar o navegado Firefox)
		https://173.169.73.1

02. System and Domain Manager
		Username: administrator
		Password: pti@2018

03. Univention Management Console (Configuração do Objeto do Servidor)
		Device
			Computers
				UCS-DC-01
					Basic settings
						Computer account
							Directory Node name: UCS-DC-01
							Description: Servidor de Nó do Diretório Primário
							Inventory number: 123456
					Save

04. Univention Management Console (Configuração da Rede do Servidor)
		Domain
			Networks
				defaults
					Basic settings
						General networks settings
							Name: default
							Networks: 173.169.73.0
							Netmask: 24
							IP Address range
								First address: 173.169.73.1
								Last address: 173.169.73.254
						DNS preferences
							DNS forward lookup zone: systech.brz 
							DNS reverse lookup zone: 173.169.73
						DHCP preferences
							DHCP service: systech.brz
					Save

05. Univention Management Console (Configuração de Linguagem do Servidor)
		System
			Languagem settings
				Language settings
					Time zone and keyboard settings
						Time zone: America/Sao_Paulo
						Keyboard model: Generic 105-key PC (int.l)
						Keyboard layout: English (US)
						Keyboard variant: English (intl., with AltGr dead Keys)
					Languagem settings
						Installed system locales
							ADD 
								Search results
									Portuguese (Brazil)
								ADD
						Default system locale
							Portuguese (Brazil)
				Apply Changes

06. Univention Management Console (Verificações Gerais do Servidor)
		System
			Networks settings
			Hardware information
			System diagnostic