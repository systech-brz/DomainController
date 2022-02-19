Autor: Jensy Gregorio Gomez
Data de criação: 19/02/2022
Data de atualização: 19/02/2022
Versão: 0.01
Testado e homologado no Firewall NG UTM Netgate pfSense 2.5.x


#PRIMEIRA ETAPA: Endereçamento das Interfaces do pfSense
	01. Should VLANS be set up now [y|n]	- n 		<ENTER>
	02. Enter the WAN interfaces name  		- vtnet0 	<ENTER>
	03. Enter the LAN interfaces name		- vtenet1	<ENTER>
	04. Do you want proceed [y|n]			- y 		<ENTER>


# Opções do Console do Netgate pfSense
	0) Logout (SSH only) 				- sair do acesso remoto via SSH
	1) Assign Interfaces 				- ativação e atribuição de Interfaces de Rede
	2) Set Interface(s) IP address 		- configuração do Endereço IPv4, IPv6 e DHCP Server
	3) Reset WebConfigurator password 	- resetar para a senha padrão (pfSense) do usuário admin o acesso via WebGui
	4) Reset to factory defaults 		- resetar para as configurações padrão do pfSense
	5) Reboot system 					- reinicializar o pfSense
	6) Halt system 						- desligar o pfSense
	7) Ping host 						- testar a conectividade de rede LAN ou WAN com o comando ping no pfSense
	8) Shell 							- acessar o Bash/Shell do pfSense
	9) pfTop 							- software de monitoramento de protocolo de conexões de rede LAN ou WAN do pfSense
	10) Filter Logs 					- filtros dos logs referente as regras de Firewall de LAN ou WAN do pfSense
	11) Restart WebConfigurator 		- reinicializar o WebConfigurator após uma falha de acesso via navegador
	12) PHP Shell + pfSense tools 		- acesso ao PHP Shell e conjunto de ferramentas de desenvolvedor do pfSense
	13) Update from console 			- atualização do pfSense via console
	14) Enable Secure Shell (sshd) 		- habilitar ou desabilitar o acesso seguro via SSH via console
	15) Restore recent configuration 	- restauração da última configuração válida do pfSense via console
	16) Restart PHP-FPM 				- reinicializar o serviço do PHP-FPM (FastCGI Process Manager) do WebConfigurator


#SEGUNDA ETAPA: Configuração do Endereço de Rede Local e DHCP Server
01. Setando o Endereçamento IPv4 ou IPV6 das Interfaces de WAN e LAN
	2) Set interface(s) IP address
		Enter the number of the interface you wish to configure: 	- 1		<ENTER>
			Configure IPV4 address WAN via DHCP (y/n):				- n		<ENTER>
			Enter  the new WAN IPV4 address
				> 192.168.1.110/24

			For a LAN, enter the new LAN IPv4 upstream gateway address
				> 192.168.1.1
				
		Enter the number of the interface you wish to configure: 	- 2 	<ENTER>
		Enter the new LAN IPv4 address.
				> 173.169.73.254/24											<ENTER>
		
		For a WAN, enter the new LAN IPv4 upstream gateway address
		For a LAN, press <Enter> for nome:
			> 																<ENTER>
		Enter the new LAN IPv6 address.
			> 																<ENTER>

		Do you want to enable the DHCP server on LAN? (y/n): 		- y 	<ENTER>

		Enter the start address of the IPv4 client address range: 
				> 173.169.73.100 											<ENTER>

		Enter the end address fo the IPv4 client address range: 
				> 173.169.73.253									 		<ENTER>

		Do you want to revert to HTTP as the WebConfigurator? (y/n)	- y 	<ENTER>	
		
		Press <Enter> to continue.



#TERCEIRA ETAPA: Verificação da conexão com a Internet na Interface WAN
01. Testando a conectividade com a Internet
	7) Ping host
		Enter a host name or IP address: google.com <Enter>
		Press <Enter> to continue.