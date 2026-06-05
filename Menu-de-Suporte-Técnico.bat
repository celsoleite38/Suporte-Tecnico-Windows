@echo off
title MENU DE SUPORTE - Celso Leite - V2.0 SUBMENU
color 0A

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Execute como Administrador!
    pause
    exit
)

:MENU_PRINCIPAL
cls
echo =============================================================================
echo - MENU DO SUPORTE TECNICO - Celso Leite - V2.0
echo =============================================================================
echo.
echo 1. Ferramentas de Disco
echo 2. Ferramentas de Redes
echo 3. Ferramentas de Windows
echo 4. Reparo de Inicializacao
echo 5. Troca de Hardware
echo 0. Sair
echo.
set /p categoria=Escolha uma categoria:

if "%categoria%"=="1" goto MENU_DISCO
if "%categoria%"=="2" goto MENU_REDE
if "%categoria%"=="3" goto MENU_WINDOWS
if "%categoria%"=="4" goto MENU_BOOT
if "%categoria%"=="5" goto MENU_HARDWARE
if "%categoria%"=="0" exit
goto MENU_PRINCIPAL

:MENU_DISCO
cls
echo ===========================Ferramentas de Disco===============================
echo 1. Verificar e Reparar Disco (CHKDSK)
echo 2. Reparar Arquivos de Sistema (SFC)
echo 3. Limpar Arquivos Temporarios
echo 4. Reparar imagens do Windows (DISM)
echo 5. Testar Velocidade de Disco
echo 6. Ver Saude do SSD
echo 0. Voltar ao Menu Principal
echo.
set /p opcao=Escolha:

if "%opcao%"=="1" chkdsk & pause & goto MENU_DISCO
if "%opcao%"=="2" sfc /scannow & pause & goto MENU_DISCO
if "%opcao%"=="3" cleanmgr & goto MENU_DISCO
if "%opcao%"=="4" Dism /Online /Cleanup-Image /RestoreHealth & pause & goto MENU_DISCO
if "%opcao%"=="5" winsat disk & pause & goto MENU_DISCO
if "%opcao%"=="6" wmic diskdrive get status & pause & goto MENU_DISCO
if "%opcao%"=="0" goto MENU_PRINCIPAL
goto MENU_DISCO

:MENU_REDE
cls
echo ===========================Ferramentas de Redes===============================
echo 1. Ping Google
echo 2. Tracert Google
echo 3. Limpar Cache DNS
echo 4. Liberar/Renovar IP
echo 5. Ver Senhas Wi-Fi
echo 0. Voltar ao Menu Principal
echo.
set /p opcao=Escolha:

if "%opcao%"=="1" ping 8.8.8.8 -n 5 & pause & goto MENU_REDE
if "%opcao%"=="2" tracert 8.8.8.8 & pause & goto MENU_REDE
if "%opcao%"=="3" ipconfig /flushdns & pause & goto MENU_REDE
if "%opcao%"=="4" ipconfig /release & ipconfig /renew & pause & goto MENU_REDE
if "%opcao%"=="5" netsh wlan show profiles & set /p rede=Nome da rede: & netsh wlan show profile name="%rede%" key=clear & pause & goto MENU_REDE
if "%opcao%"=="0" goto MENU_PRINCIPAL
goto MENU_REDE

:MENU_WINDOWS
cls
echo ========================-Ferramentas de Windows-==============================
echo 1. Gerenciador de Tarefas
echo 2. Windows Update
echo 3. Criar Ponto de Restauracao
echo 4. Winget Update All
echo 5. Informacoes do Sistema
echo 0. Voltar ao Menu Principal
echo.
set /p opcao=Escolha:

if "%opcao%"=="1" taskmgr & goto MENU_WINDOWS
if "%opcao%"=="2" start ms-settings:windowsupdate & goto MENU_WINDOWS
if "%opcao%"=="3" powershell "Checkpoint-Computer -Description 'Manual %date%'" & pause & goto MENU_WINDOWS
if "%opcao%"=="4" winget update --all & pause & goto MENU_WINDOWS
if "%opcao%"=="5" systeminfo | more & pause & goto MENU_WINDOWS
if "%opcao%"=="0" goto MENU_PRINCIPAL
goto MENU_WINDOWS

:MENU_BOOT
cls
echo =======================Reparo de Inicializacao================================
echo 1. Reparar MBR
echo 2. Reparar Setor Boot
echo 3. Reconstruir BCD
echo 0. Voltar
echo.
set /p opcao=Escolha:
if "%opcao%"=="1" bootrec /fixmbr & pause & goto MENU_BOOT
if "%opcao%"=="2" bootrec /fixboot & pause & goto MENU_BOOT
if "%opcao%"=="3" bootrec /rebuildbcd & pause & goto MENU_BOOT
if "%opcao%"=="0" goto MENU_PRINCIPAL
goto MENU_BOOT

:MENU_HARDWARE
cls
echo ========================Troca de Hardware=====================================
echo 1. Sysprep - Preparar para novo PC
echo 2. Ver Modelo Placa-Mae
echo 0. Voltar
echo.
set /p opcao=Escolha:
if "%opcao%"=="1" %windir%\system32\sysprep\sysprep.exe & goto MENU_HARDWARE
if "%opcao%"=="2" wmic baseboard get product,Manufacturer & pause & goto MENU_HARDWARE
if "%opcao%"=="0" goto MENU_PRINCIPAL
goto MENU_HARDWARE