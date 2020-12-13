Clear-Host

#Sélectionner du fichier .ini
$Folder_Ini="C:\_DATA_\BACKUPs\Sites_Web\_data_backup\_Id_FTP\"
$Folder_List = Get-ChildItem -Path $Folder_Ini -Force -File | Where-Object {$_.Name -match 'ini$'}
foreach ($File_Ini in $Folder_List)
{
	Write-Host "$($File_Ini.name)"
}
$Selected_File=""
while ((Test-Path ($Folder_Ini + $Selected_File + ".ini")) -eq $False) {
	$Selected_File=Read-Host -Prompt "Sectionner un fichier (sans l'extension) "
}

#Data catch
$Fichier_Id=$Folder_Ini + $Selected_File + ".ini"
$Backup_Dir=(Get-Content $Fichier_Id)[4]
$Data_Connect="open ftpes://" + (Get-Content $Fichier_Id)[0] + ":" + (Get-Content $Fichier_Id)[1] + "@" + (Get-Content $Fichier_Id)[2] + "/ -certificate=`"`"" + (Get-Content $Fichier_Id)[3] + "`"`" -rawsettings ProxyPort=0"
$Sub_Dir="get "+(Get-Content $Fichier_Id)[4]
$Master_Dir="cd "+(Get-Content $Fichier_Id)[5]

#Var declaration
$Horodateur=Get-Date -format "yyyyMMddHHmmss"
$SavLocation=New-Item -Path ('C:\_DATA_\BACKUPs\Sites_Web\' + $Backup_Dir + '\Backup_' + $Backup_Dir + $Horodateur) -ItemType Directory

$WinscpLog=('C:\_DATA_\BACKUPs\Sites_Web\' + $Backup_Dir + "\Log_" + $Backup_Dir + $Horodateur + '.log')

#Process Backup_DB.php
$Open_Dir="https://beeingmanager.com/PHP_Script/Backup_DB.php?DB_Id="+$Selected_File

Start microsoft-edge:$Open_Dir

# Process Download
& "C:\Program Files (x86)\WinSCP\WinSCP.com" `
  /log=$WinscpLog /ini=nul `
  /command `
    $Data_Connect `
    $Master_Dir `
    ("lcd " + $SavLocation) `
    $Sub_Dir `
    "exit"

If($LastExitCode -eq 0) {
    Write-Host "Download SUCCESS"
}
else {
    Write-Host "Download ERROR"
}

# Process Compress
Get-ChildItem -Path $SavLocation | Compress-Archive -DestinationPath $SavLocation -CompressionLevel Optimal
Remove-Item $SavLocation -Recurse -Force

Write-Host "Compress SUCCESS"

Read-Host -Prompt "Press Enter to exit"