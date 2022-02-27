Autor: Robson Vaamonde
Procedimentos em TI: http://procedimentosemti.com.br
Bora para Prática: http://boraparapratica.com.br
Robson Vaamonde: http://vaamonde.com.br
Facebook Procedimentos em TI: https://www.facebook.com/ProcedimentosEmTi
Facebook Bora para Prática: https://www.facebook.com/BoraParaPratica
Instagram Procedimentos em TI: https://www.instagram.com/procedimentoem
YouTUBE Bora Para Prática: https://www.youtube.com/boraparapratica
LinkedIn Robson Vaamonde: https://www.linkedin.com/in/robson-vaamonde-0b029028/
Data de criação: 30/07/2021
Data de atualização: 13/08/2021
Versão: 0.05
Testado e homologado no UCS Univention Core Free 5.0.x

Atualização do UCS: https://docs.software-univention.de/quickstart-en-5.0.html
Manual do UCS: https://docs.software-univention.de/manual-5.0.html
Active Directory UCS: https://www.univention.com/products/ucs/functions/services-windows-samba/
Active Directory Compatible: https://www.univention.com/products/univention-app-center/app-catalog/samba4/
Release Notes UCS 5.0: https://docs.software-univention.de/release-notes-5.0-0-en.html
UCS Univention Performance guide: https://docs.software-univention.de/performance-guide-5.0.pdf
Instalação do UCS: https://docs.software-univention.de/quickstart-en-5.0.html
Scenarios for Univention Corporate Server: https://docs.software-univention.de/scenarios-en.html

OBSERVAÇÃO IMPORTANTE: Na versão 5.0 do UCS as funções do sistema foram renomeadas.
DE: Controlador de Domínio Mestre	--> PARA: Nó de Diretório Primário;
DE: Controlador de Domínio Backup	--> PARA: Nó de Diretório Backup;
DE: Controlador de Domínio Escravo	--> PARA: Nó de Diretório Réplica;
DE: Servidor Membro do Domínio		--> PARA: Nó Gerenciado.

Nó de Domínio Backup é o sistema de fallback (queda) para o Nó de Diretório Primário do UCS, 
ele pode assumir a função de Nó de Diretório Primário permanentemente se for necessário, é 
recomendado usar pelo menos um Nó de Diretório de Backup no domínio do UCS Core Free.

OBSERVAÇÃO IMPORTANTE: no vídeo não foi falado sobre a ordem de inicialização dos servidores UCS,
o correto e sempre iniciar o Servidor de Nó de Diretório Primário, aguardar a sua inicialização,
depois iniciar o Servidor de Nó de Diretório Backup para que o sincronismo entre os servidores
seja feito de forma correta, o procedimento para desligar é o inverso, primeiro o Backup depois
o Primário.

Primeira etapa: Criação e Configuração da Máquina Virtual no Oracle VirtualBOX
01. Ferramentas;
		Novo
			Nome e Sistema Operacional:
			Nome: UCS-Backup
			Pasta da Máquina: (deixar o padrão do sistema) 
			Tipo: Linux
			Versão: Debian (64-bit)
			<Próximo>
		Tamanho da memória:
			Tamanho: 4096MB
			<Próximo>
		Disco Rígido:
			Criar um novo disco rígido virtual agora
			<Criar>
				Tipo de arquivo de disco rígido
				VDI (VirtualBOX Disk Image)
				<Próximo>
			Armazenamento em disco rígido físico
				Dinamicamente alocado
				<Próximo>
			Localização e tamanho do arquivo
				Localização: (deixar o padrão do sistema)
				Tamanho do disco: 50GB
				<Criar>

08. Configurações da Máquina Virtual UCS (Propriedades/Configurações)
	Sistema
		Processador
			Processadores: 02 CPU
			Recursos Estendidos: Habilitar PAE/NX
	Monitor
		Tela
			Memória de Vídeo: 128MB
			Aceleração: Habilitar Aceleração 3D
	Áudio
		Habilitar Áudio: Desabilitar
	Rede
		Adaptador 1 (WAN)
			Habilitar Placa de Rede
			Conectado a: Rede Interna
			Nome: (deixar o padrão do sistema: intnet)
	<OK>

Segunda etapa: Adicionando a ISO do UCS Univention
01. VM UCS-Univention-5.0: 
	<Iniciar>
	Selecione o disco rígido de boot
		Selecionar um arquivo de disco óptico virtual
	Seletor de Discos Ópticos
		Acrescentar
		Selecione o arquivo de disco óptico virtual: UCS-Installation-amd64.iso
		<Abrir>
	Not Attached
		Selecionar: UCS-Installation-amd64.iso
		<Escolher>
	<Iniciar>

Terceira Etapa: Instalando o UCS Univention 5.0.x Core Free
01. Parar o Boot do Grub do UCS Univention
		Start with manual network settings <Enter>
02. Select a Language
		English - English 
		<Continue>
03. Select your Location
		other
			South America
				Brazil 
		<Continue>
04. Configure Locales
		United States - en_US.UTF-8
		<Continue>
05. Configure the Keyboard
		American English
		<Continue>
06. Configure the network
		IP address: 173.169.73.2/24
		<Continue>
07. Configure the network
		Gateway: 173.169.73.254
		<Continue>
08. Configure the network
		Name server addresses: 173.169.73.1 173.169.73.2 173.169.73.254
		<Continue>
09. Se up users and passwords
		Root password: pti@2018
		Re-enter password to verify: pti@2018
		<Continue>
10. Partition disks
		Partitioning method: Guided - use entire disk and set up LVM
		<Continue>
11. Partition disks
		Select disk to partition: SCSI3 (0,0,0)(sda) - 53,7 GB ATA VBOX HARD DISK
		<Continue>
12 Partition disks
		Partitioning scheme: Separate /home, /var and /tmp partitions
		<Continue>
13  Partition disks
		Write the changes to disks and configure? Yes
		<Continue>
14  Partition disks
		Write the changes to disks? Yes
		<Continue>
15. Finish the installation
		<Continue>

Quarta Etapa: Configuração o UCS Univention 5.0.x Core Free
01. Domain setup
		Join into an existing UCS domain
		<Next>
02. System role
		Backup Directory Node
		<Next>
03. Domain join information
		[Select] Start join at the end of the installation
		[Select] Search Primary Directory Node in DNS
		Hostname of the Primary Directory Node: UCS-DC-01.systech.brz
		Username: administrator
		Password: pti@2018
		<Next>
04. Host settings
		Specify the name of this system: UCS-Backup.systech.brz
		<Next>
05. Confirm configuration settings
		[Disable] Update system after setup
		<Configure System>
06. UCS setup successful
		<Finish>

Quinta etapa: Atualizando o UCS Univention 5.0.x Core Free
01. Login
		login: root <Enter>
		password: pti@2018 <Enter>
02. Upgrade
		univention-upgrade <Enter>
		Do you want to continue [Y|N]? Y <Enter>
03. Apt
		apt update <Enter>
		apt upgrade <Enter>
		apt autoremove
			Do you want to continue [Y|N]? Y <Enter>
		apt autoclean <Enter>
		
04. reboot <Enter>

Sexta etapa: Acessando o WebManagement do UCS Univention
01. Acessar o WebManagement (recomendado utilizar o navegado Firefox)
		https://UCS-DC-01.systech.brz
		Avançado
		Aceitar o risco e continuar
02. Server overview
		Username: administrator
		Password: pti@2018
03. Acessando os servidores remotamente
		https://UCS-DC-01.systech.brz
		https://UCS-Backup.systech.brz

Sétima etapa: Reconfiguração dos Principais Serviços de Rede
01. Configuração da Rede no Servidor Backup
	System
		Network settings
			Domain name server:
				173.169.73.2
				173.169.73.1
		Apply changes
			Apply changes

02. Configuração da Rede no Servidor Primário
	System
		Network settings
			Domain name server:
				173.169.73.1
				173.169.73.2
		Apply changes
			Apply changes

03. Configuração do Serviço de DHCP no Servidor Primário
	Domain
		DHCP
			systech.brz
				172.16.1.0 (Subnet)
					Policies
						Policy: DHCP DNS
							Edit Policy
								Domain name server:
									173.169.73.1
									173.169.73.2
							Save
				Save

04. Instalação do SAMBA-4 Active Directory no UCS Univention Backup
	App Center 
		Installed in domain
			Active Directory-Compatible Domain Controller
				Manage Installations
					Install 
						Host for installation of App: UCS-Backup.systech.brz
						Continue
						Start Installation

05. Renovação do endereçamento IPv4 do Desktop Windows 10.
	Pesquisa do Windows
		Power Shell
			ipconfig /release
			ipconfig /renew
			ipconfig /all
			nslookup systech.brz
			ping systech.brz