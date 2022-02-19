Autor: Jensy Gregorio Gomez
Data de criação: 19/02/2022
Data de atualização: 19/02/2022
Versão: 0.01
Testado e homologado no Firewall NG UTM Netgate pfSense 2.5.x


# PRIMEIRA ESTAPA: Download da ISO do Netgate UTM pfSense
	01. Link de download do pfSense: https://www.pfsense.org/download/
	02. Versão do download pfSense: 2.5.2 (28/01/2022)
	03. Arquitetura do pfSense: AMD64 (64-bit)
	04. Tipo de instalação: DVD Image (ISO) Installer
	05. Mirror padrão do download: New York City, USA
	06. Arquivo compactado utilizando o GZ (GNU Zip - Gzip)
	07. Extrair o conteúdo do arquivo compactado para utilizar a ISO do pfSense
	08. Dica: se você utiliza o Microsoft Windows recomendo instalar o 7-Zip: https://www.7-zip.org/download.html

# SEGUNDA ETAPA: Criação e Configuração da Máquina Virtual no PROXMOX
01. Criar Maquina Virtual;
	GERAL
		VM ID: 				200
		nome:				pfSense
	SO 	
		não usar qualquer midia
	SISTEMA 
		Agente QEMU

	DISCOS 
		Tamanhop do Disco:	10GB

	CPU
		Nucleos:			2
		Habilitar Numa:		yes

	MEMORIA
		Memoria:			2048
		Minimo Memorio:		1024	


# TERCEIRA ETAPA: Inicializar el Instalador

01. Copyright and distribution notice: 
	Accept - <Enter>

02. Welcome to pfSense!
	Install (Install pfSense) - <Enter>

03. Keymap Selection
	Brazilian (accent keys) - <Enter>
	Continue with br.kdb keymap - <Enter>

04. Partitioning
	Auto (ZFS) Guided Root-on-ZFS - <Enter>
	
	04.1 Configure Options:
		>>> Install (Proceed with Installation) - <Enter>
		T Pool Type/Disks:		stripe: 0 disks
		- Rescan Devices		*
		- Disk Info 			*
		N Pool Name				pfsense
		4 Force 4K Sectores?	YES
		E Encrypt Disks?		NO
		P Partition Scheme		GPT (BIOS)
		S Swap Size				1g
		M Mirror Swap?			NO
		W Encrypt Swap?			NO
	
	04.2 Select Virtual Device type:
		stripe Stripe - No Redundancy <Enter>

	04.3 Hard Disk Selection
		[*] ada0 VBOX HARDDISK - <Space-Bar> - <Enter>

	04.4 Last Chance! - <Yes> - <Enter>

05. Manual Configuration: <No> - <Enter>

06. Complete: <Reboot> - <Enter>

