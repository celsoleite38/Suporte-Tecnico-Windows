# Menu de Suporte Técnico - Windows

Toolkit completo em Batch e PowerShell com 44+ ferramentas para diagnóstico e reparo de Windows, redes e hardware. Ideal para técnicos de TI e usuários avançados.

**Versão:** 3.0  
**Autor:** Celso Leite  
**Licença:** MIT  

### ⚠️ AVISO IMPORTANTE
Todas as ferramentas exigem privilégios de **Administrador**. Executar sem admin causa falhas em comandos como `chkdsk`, `sfc`, `dism` e `sysprep`.

### 📦 Versões disponíveis

| Arquivo | Descrição | Recomendado para |
| --- | --- | --- |
| `menu-suporte-v1.1.bat` | Menu único com 44 opções | Uso rápido no pendrive |
| `menu-suporte-v2.0-submenu.bat` | Organizado em 5 categorias | Quem prefere menus limpos |
| `MenuSuporte.ps1` | Interface gráfica com botões e abas | Atendimento ao cliente |

### 🚀 Como usar

#### **Versão BAT - V1.1 e V2.0**
1. Baixe o `.bat` desejado
2. Clique com botão direito no arquivo
3. Selecione **Executar como administrador**
4. Escolha a opção pelo número e pressione Enter

#### **Versão PowerShell - V3.0 GUI**
**Método 1 - Mais fácil:**
1. Baixe `MenuSuporte.ps1`
2. Clique com botão direito > **Executar com PowerShell**
3. Se pedir permissão de Admin, clique em **Sim**

**Método 2 - Se bloquear por política de execução:**
1. Abra o PowerShell como Admin: Menu Iniciar > digite `powershell` > Executar como admin
2. Rode o comando: `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
3. Digite `S` e Enter para confirmar
4. Agora execute o arquivo `.ps1` normalmente

### 🛠️ Ferramentas incluídas

#### **Disco e Armazenamento**
- `CHKDSK` - Verifica e repara setores defeituosos
- `SFC /Scannow` - Repara arquivos de sistema corrompidos
- `DISM /RestoreHealth` - Repara imagem do Windows
- `CleanMgr` - Limpeza de disco
- `WinSAT` - Teste de velocidade do disco
- `Get-PhysicalDisk` - Diagnóstico de saúde do SSD/HD
- `Defrag` - Desfragmentador para HDs

#### **Rede e Internet**
- `Ping` e `Tracert` - Testa conectividade e rota
- `IPConfig /FlushDNS` - Limpa cache DNS
- `IPConfig /Release/Renew` - Renova endereço IP
- `Netsh Winsock Reset` - Reseta pilha de rede
- `Netsh WLAN Show Profiles` - Mostra senhas de Wi-Fi salvas
- `Netstat` - Lista portas abertas

#### **Windows e Sistema**
- `Winget Update --all` - Atualiza todos os programas instalados
- `Checkpoint-Computer` - Cria ponto de restauração manual
- `Powercfg /batteryreport` - Gera relatório de bateria
- `MRT` - Ferramenta de remoção de software malicioso
- `MpCmdRun` - Scan rápido do Windows Defender
- `Powercfg` - Ativa plano Desempenho Máximo
- `WMIC Baseboard` - Mostra marca e modelo da placa-mãe

#### **Reparo de Inicialização**
> Requer boot por mídia de instalação do Windows
- `Bootrec /FixMBR` - Repara Master Boot Record
- `Bootrec /FixBoot` - Repara setor de inicialização
- `Bootrec /RebuildBCD` - Reconstrói arquivo BCD

#### **Troca de Hardware**
- `Sysprep` - Prepara o SSD para ser usado em outro PC

### 🖼️ Screenshots

**Versão PowerShell V3.0:**
Interface com abas para Disco, Rede, Windows e Boot/Hardware. Cada botão executa o comando e mostra o log em tempo real.

### 🔧 Solução de problemas

**1. "Execute como Administrador!"**
Você não clicou com botão direito > Executar como admin. Todas as ferramentas falham sem privilégio elevado.

**2. PowerShell: "A execução de scripts foi desabilitada"**
Execute no PowerShell Admin: `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`

**3. Arquivo `.ps1` abre no Bloco de Notas**
O Windows salvou como `.ps1.txt`. Ative "Extensões de nomes de arquivos" no Explorer e renomeie removendo o `.txt`.

**4. Comando `winget` não encontrado**
Winget só vem no Windows 10 22H2+ e Windows 11. Instale pela Microsoft Store: "App Installer".

**5. `sfc` ou `dism` dá erro**
Rode o `chkdsk` primeiro, depois `sfc /scannow`, depois `dism /RestoreHealth` nessa ordem.

### 🤝 Como contribuir
1. Faça um Fork do projeto
2. Crie uma branch: `git checkout -b minha-feature`
3. Commit suas mudanças: `git commit -m 'Adiciona ferramenta X'`
4. Push na branch: `git push origin minha-feature`
5. Abra um Pull Request

### 📝 Observações técnicas
- Opção DISM: execute SFC antes para melhores resultados
- Opção Sysprep: use `OOBE + Generalizar + Desligar` antes de trocar o SSD
- Comandos de boot: só funcionam pelo prompt da mídia de instalação
- Versão PS1: testada no PowerShell 5.1 e 7.x

### 📄 Licença
Este projeto está sob licença MIT. Fique à vontade para usar, modificar e distribuir.

---
**Desenvolvido por Celso Leite** | Para suporte técnico em São Lourenço - MG
