################################################################
################################################################
####														####
####            DOWNLOAD DA ISO DO UCS UNIVENTION      		####
####														####
################################################################
################################################################

01. Link de download do UCS 5.0.x: https://download.software-univention.de/download/ucs-cds/ucs5.0-0-rc1/
02. Versão do download UCS: 5.0.x RC1 (21/04/2021)
03. Arquitetura do UCS: AMD64 (64-bit)
04. Tipo de instalação: DVD Image (ISO) Installer











################################################################
################################################################
####														####
####            CRIAÇÃO VM NO PROXMOX		           		####
####														####
################################################################
################################################################

Segunda etapa: Criação e Configuração da Máquina Virtual no Oracle VirtualBOX
01. Ferramentas;
		Novo
			Nome e Sistema Operacional:
			Nome: UCS Univention 5.0
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
			Processadores: 02 CPUs
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

Instalação do UCS: https://docs.software-univention.de/quickstart-en-5.0.html










################################################################
################################################################
####														####
####            CONFIGURANDO  SAMBA NO BOOT           		####
####														####
################################################################
################################################################

Terceira etapa: Adicionando a ISO do UCS Univention
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










################################################################
################################################################
####														####
####            INSTALANDO O UCS UNIVENTION           		####
####														####
################################################################
################################################################

Quarta Etapa: Instalando o UCS Univention 5.0.x Core Free
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
		IP address: 173.169.73.1/24
		<Continue>
07. Configure the network
		Gateway: 173.169.73.254
		<Continue>
08. Configure the network
		Name server addresses: 173.169.73.1 173.169.73.254 8.8.8.8
		<Continue>
09. Se up users and passwords
		Root password: Casado#55
		Re-enter password to verify: Casado#55
		<Continue>
10. Partition disks
		Partitioning method: Guided - use entire disk and set up LVM
		<Continue>
11. Partition disks
		Select disk to partition: SCSI3 (0,0,0)(sda) - 53,7 GB ATA VBOX HARDISK
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










###############################################################
################################################################
####														####
####            CONFIGURANDO O UCS UNIVENTION          		####
####														####
################################################################
################################################################

01. Domain setup
		Create a new UCS domain (Recommended)
		<Next>
02. Account information
		Organization name: Bora para Pratica 
		E-mail address to active UCS: systech.brz@gmail.com
		<Next>
03. Host settings
		Fully qualified domain name: UCS-DC-01.systech.brz
		LDAP base: dc=systech,dc=brz
		<Next>
04. Confirm configuration settings
		Disable: Update system after setup
		<Configure System>
05. UCS setup successful
		<Finish>










################################################################
################################################################
####														####
####            ATUALIZANDO O UCS UNIVENTION           		####
####														####
################################################################
################################################################

01. Login
		login: root <Enter>
		password: Casado#55 <Enter>
02. Upgrade
		univention-upgrade <Enter>
		Do you want to continue [Y|N]? Y <Enter>
03. Reboot
		reboot <Enter>










################################################################
################################################################
####														####
####            ACESSANDO O WEBMANAGEMENT           		####
####														####
################################################################
################################################################


01. Acessar o WebManagement (recomendado utilizar o navegado Firefox)
		https://173.169.73.1
		Avançado
		Aceitar o risco e continuar
02. System and Domain Manager
		Username: administrator
		Password: Casado#55
03. Welcome to UMC
		Everything worked great <Next>
		Enable one-time statistic on hardware configuration <Next>
		Upload License File... <Next>
		Further information <Next>
		Completion of startup wizard: <Finish>