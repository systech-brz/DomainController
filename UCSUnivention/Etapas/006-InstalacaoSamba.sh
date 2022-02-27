Primeira etapa: Configurações Gerais do Servidor UCS
01. Acessar o WebManagement (recomendado utilizar o navegado Firefox)
		https://173.169.73.1

02. System and Domain Manager
		Username: administrator
		Password: Casado#55

03. Software (Instalação do SAMBA-4 Active Directory Domain Service)
		App Center
			Active Directory-compatible Domain Controller
				Install
					Start Installation
			Back to Overview

OBSERVAÇÃO: É RECOMENDADO FAZER O REBOOT DO SERVIDOR
PARA VERIFICAR SE O SERVIÇO DO SAMBA-4 VAI FUNCIONAR
CORRETAMENTE NA INICIALIZAÇÃO DO SISTEMA DO UCS 
UNIVENTION CORE FREE V5.0

04. Acessar remotamente o Servidor UCS via SSH
		ssh root@173.169.73.1
		reboot

05. Domain (Verificação da Instalação do SAMBA-4)
		Admin Diary

06. Domain (Verificação dos Registros do LDAP do SAMBA-4)
		LDAP Directory

07. Users (Verificação dos Grupos padrão do SAMBA-4)
		Groups

08. System (Verificação da Saúde do Servidor e do SAMBA-4)
		System diagnostic

09. System (Verificação do Serviço do SAMBA-4)
		System services
			Search: samba

10. Verificação das informações detalhadas do SAMBA-4 via Bash/Shell
		ssh root@173.169.73.1
			a) verificando o serviço do SAMBA-4: 
				systemctl status samba-ad-dc.service
			b) verificando a versão do SAMBA-4: 
				samba -V
			c) verificando informações do Domínio do SAMBA-4: 
				samba-tool domain info systech.brz
			d) verificando o nível funcional do Domínio do SAMBA-4: 
				samba-tool domain level show
			e) verificando informações do FSMO do Domínio do SAMBA-4: 
				samba-tool fsmo show
			f) verificando a data e hora do Domínio do SAMBA-4: 
				samba-tool time
			g) verificando a Zona de Pesquisa Direta do Domínio do SAMBA-4: 
				samba-tool dns zonelist systech.brz -U administrator --password=Casado#55
			h) verificando a Zona de Pesquisa Reversa do Domínio do SAMBA-4: 
				samba-tool dns zonelist systech.brz --reverse -U administrator --password=Casado#55
			i) verificando as resoluções de nome no servidor:	
				host -t A UCS-DC-01
				host -t A UCS-DC-01.systech.brz
				host -t A systech.brz
				host -t A 173.169.73.1
			j) verificando as configuração do arquivo do SAMBA-4: 
				samba-tool testparm
			k) verificando os compartilhamos do Domínio do SAMBA-4: 
				smbclient -L localhost -U%
			l) verificando os status dos compartilhamos do Domínio do SAMBA-4: 
				smbstatus -v
			m) verificando a localização dos arquivos de configuração do Domínio do SAMBA-4: 
				samba -b
			n) verificando as informações do LDAP do Domínio do SAMBA-4: 
				net ads info

11. Testando os resoluções de nomes no Microsoft Windows e GNU/Linux
		nslookup UCS-DC-01
		nslookup UCS-DC-01.systech.brz
		nslookup systech.brz
		nslookup 173.169.73.1
		ping systech.brz

12. Testando o acesso aos compartilhamos no Microsoft Windows e GNU/Linux
		Microsoft Windows: \\UCS-DC-01
		GNU/Linux Mint: Gerenciador de Arquivos Nemo;
							Arquivos
								Conectar a um servidor
									Servidor: UCS-DC-01
									Tipo: Compartilhamento do Windows
								Conectar