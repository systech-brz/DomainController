
################################################################
################################################################
####														####
####            ATUALIZANDO O UCS UNIVENTION           		####
####														####
################################################################
################################################################
Primeira etapa: Atualizando o UCS Univention via Bash/Shell
01. Login
		login: root <Enter>
		password: pti@2018 <Enter>
02. Upgrade
		univention-upgrade <Enter>
			Do you want to continue [Y|N]? Y <Enter>
		reboot <Enter>
03. Apt
		apt update <Enter>
		apt upgrade <Enter>
		apt autoremove
			Do you want to continue [Y|N]? Y <Enter>
		apt autoclean <Enter>
		reboot <Enter>

Segunda etapa: Atualizando o UCS Univention via WebManagement
01. Acessar o WebManagement (recomendado utilizar o navegado Firefox)
		https://173.169.73.1
02. System and Domain Manager
		Username: administrator
		Password: pti@2018
03. Favorites ou Software
		Software Update
			Check for Package Updates
			Install Package Update

Documentação do Licenciamento: https://docs.software-univention.de/manual-5.0.html#central:license

Terceira etapa: Licenciando o UCS Univention
01. Acessar o WebManagement (recomendado utilizar o navegado Firefox)
		https://172.16.1.10
02. System and Domain Manager
		Username: administrator
		Password: pti@2021
03. Favorites
		Welcome!
			Import a License
				Import from file...
					ucs.license <Abrir>
				<Ok>
			License info
				<Close>