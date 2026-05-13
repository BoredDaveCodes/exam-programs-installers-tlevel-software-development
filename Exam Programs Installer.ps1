#Exam Programs Installer
Write-Host"-----Exam Programs Installer-----"

$version = "3.14.5"
$url = "https//:python.org$version/python-$version-amd64.exe"
$installerPath = "$env:TEMP\python-installer.exe"
$targetDir = "$env:ProgramFiles\Python314"

