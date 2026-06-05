# Contorna politica de execucao so pra essa sessao
if ($ExecutionContext.SessionState.LanguageMode -ne "FullLanguage") {
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`""
    exit
}

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Verifica Admin
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`""
    exit
}

# Janela Principal
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Menu de Suporte Tecnico - Celso Leite V3.0'
$form.Size = New-Object System.Drawing.Size(900,600)
$form.StartPosition = 'CenterScreen'
$form.BackColor = '#1e1e1e'

# Abas
$tabControl = New-Object System.Windows.Forms.TabControl
$tabControl.Size = New-Object System.Drawing.Size(860,480)
$tabControl.Location = New-Object System.Drawing.Point(10,10)
$form.Controls.Add($tabControl)

# Função pra criar botões
function Add-Button {
    param($tab, $text, $x, $y, $command)
    $btn = New-Object System.Windows.Forms.Button
    $btn.Text = $text
    $btn.Location = New-Object System.Drawing.Point($x,$y)
    $btn.Size = New-Object System.Drawing.Size(190,35)
    $btn.BackColor = '#0078d4'
    $btn.ForeColor = 'White'
    $btn.FlatStyle = 'Flat'
    $btn.Add_Click({
        $outputBox.AppendText(">> Executando: $text...`r`n")
        Start-Process powershell -ArgumentList "-Command", $command -Wait -NoNewWindow
        $outputBox.AppendText(">> Concluido!`r`n`r`n")
        $outputBox.SelectionStart = $outputBox.Text.Length
        $outputBox.ScrollToCaret()
    })
    $tab.Controls.Add($btn)
}

# Aba Disco
$tabDisco = New-Object System.Windows.Forms.TabPage
$tabDisco.Text = 'Disco'
$tabDisco.BackColor = '#2d2d2d'
$tabControl.TabPages.Add($tabDisco)
Add-Button $tabDisco 'CHKDSK' 20 20 'chkdsk'
Add-Button $tabDisco 'SFC /Scannow' 220 20 'sfc /scannow'
Add-Button $tabDisco 'Limpar Temp' 420 20 'cleanmgr'
Add-Button $tabDisco 'DISM RestoreHealth' 620 20 'Dism /Online /Cleanup-Image /RestoreHealth'
Add-Button $tabDisco 'Desabilitar Recall' 20 70 'DISM /online /Disable-Feature /FeatureName:Recall'
Add-Button $tabDisco 'Testar Disco' 220 70 'winsat disk'
Add-Button $tabDisco 'Desfragmentar C:' 420 70 'defrag C:'
Add-Button $tabDisco 'Saude SSD' 620 70 'Get-PhysicalDisk | Format-Table'
Add-Button $tabDisco 'Espaco em Disco' 20 120 'Get-PSDrive -PSProvider FileSystem'

# Aba Rede
$tabRede = New-Object System.Windows.Forms.TabPage
$tabRede.Text = 'Rede'
$tabRede.BackColor = '#2d2d2d'
$tabControl.TabPages.Add($tabRede)
Add-Button $tabRede 'Ping 8.8.8.8' 20 20 'ping 8.8.8.8 -n 5'
Add-Button $tabRede 'Tracert' 220 20 'tracert 8.8.8.8'
Add-Button $tabRede 'IP Publico' 420 20 '(Invoke-WebRequest ifconfig.me/ip).Content'
Add-Button $tabRede 'Reset Winsock' 620 20 'netsh winsock reset; netsh int ip reset'
Add-Button $tabRede 'Liberar IP' 20 70 'ipconfig /release'
Add-Button $tabRede 'Renovar IP' 220 70 'ipconfig /renew'
Add-Button $tabRede 'Flush DNS' 420 70 'ipconfig /flushdns'
Add-Button $tabRede 'Tabela ARP' 620 70 'arp -a'
Add-Button $tabRede 'Portas Abertas' 20 120 'netstat -an | findstr LISTENING'

# Aba Windows
$tabWin = New-Object System.Windows.Forms.TabPage
$tabWin.Text = 'Windows'
$tabWin.BackColor = '#2d2d2d'
$tabControl.TabPages.Add($tabWin)
Add-Button $tabWin 'Task Manager' 20 20 'taskmgr'
Add-Button $tabWin 'Monitor Recursos' 220 20 'resmon'
Add-Button $tabWin 'Windows Update' 420 20 'Start-Process ms-settings:windowsupdate'
Add-Button $tabWin 'Info Sistema' 620 20 'systeminfo'
Add-Button $tabWin 'Firewall On/Off' 20 70 'netsh advfirewall set allprofiles state off'
Add-Button $tabWin 'Event Viewer' 220 70 'eventvwr'
Add-Button $tabWin 'Ponto Restauracao' 420 70 'Checkpoint-Computer -Description "Manual"'
Add-Button $tabWin 'Winget Update' 620 70 'winget update --all'
Add-Button $tabWin 'GPUpdate' 20 120 'gpupdate /force'
Add-Button $tabWin 'MRT' 220 120 'mrt'
Add-Button $tabWin 'Regedit' 420 120 'regedit'
Add-Button $tabWin 'Diag Memoria' 620 120 'mdsched'
Add-Button $tabWin 'Relatorio Bateria' 20 170 'powercfg /batteryreport; Start-Process battery-report.html'
Add-Button $tabWin 'Uptime' 220 170 'net statistics workstation | findstr since'
Add-Button $tabWin 'Limpar Spooler' 420 170 'Stop-Service spooler; Remove-Item $env:systemroot\System32\spool\printers\* -Force; Start-Service spooler'
Add-Button $tabWin 'Defender Scan' 620 170 '& "$env:ProgramFiles\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1'
Add-Button $tabWin 'Desempenho Maximo' 20 220 'powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61; powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61'
Add-Button $tabWin 'Modelo Placa-Mae' 220 220 'wmic baseboard get product,Manufacturer'

# Aba Boot/Hardware
$tabBoot = New-Object System.Windows.Forms.TabPage
$tabBoot.Text = 'Boot/Hardware'
$tabBoot.BackColor = '#2d2d2d'
$tabControl.TabPages.Add($tabBoot)
Add-Button $tabBoot 'Fix MBR' 20 20 'bootrec /fixmbr'
Add-Button $tabBoot 'Fix Boot' 220 20 'bootrec /fixboot'
Add-Button $tabBoot 'Rebuild BCD' 420 20 'bootrec /rebuildbcd'
Add-Button $tabBoot 'Sysprep' 620 20 '& "$env:windir\system32\sysprep\sysprep.exe"'

# Caixa de Output
$outputBox = New-Object System.Windows.Forms.TextBox
$outputBox.Multiline = $true
$outputBox.ScrollBars = 'Vertical'
$outputBox.Size = New-Object System.Drawing.Size(860,70)
$outputBox.Location = New-Object System.Drawing.Point(10,500)
$outputBox.BackColor = '#000000'
$outputBox.ForeColor = '#00ff00'
$outputBox.Font = New-Object System.Drawing.Font("Consolas",9)
$outputBox.Text = "Menu de Suporte iniciado. Clique em um botao para executar.`r`n"
$form.Controls.Add($outputBox)

[void]$form.ShowDialog()