#Exam Programs Installer
#Please ensure that you are in administrator mode of powershell, for this to work
Write-Host"-----Exam Programs Installer-----"

#Python Installer

$version = "3.14.5"
$url = "https//:python.org$version/python-$version-amd64.exe"
$installPath = "$env:TEMP\python-installer.exe"
$targetDir = "$env:ProgramFiles\Python314"

Write-Host "Intalling Python $version..." -ForegroundColor Light Magenta
Invoke-WebRequest -Uri $url -OutFile $installPath

Write-Host "Installing python Globally (not literally, just on the machine XD)!" -ForegroundColor Light Magenta
$installArguements = /quiet InstallAllUsers=1 PrependPath=1 TargetDir= `"$targetDir`" Include_test=0"
Start-Process -FilePath $installerPath -ArguementList $installArguements -Wait - NoNewWindow

Write-Host "Washing the installer to make it shiny..." -ForegroundColor Light Cyan
Remove-Item -Path $installerPath -Force

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "Global Python installation complete!" -ForegroundColor purple
python --version

Write-Host "Now intalling Global Python Packages..." -ForegroundColor Light Magenta

$pipArguements = "-m pip install --upgrade pandas matplotlib"
Start-Process -FilePath "python.exe" -ArguementList $pipArguements -Wait -NoNewWindow

Write-Host "Packages installed (pandas, matplotlib and numpy) successfully, now you can code things on python with data files and csv XD!" -ForegroundColor purple

#LibreOffice Installer

Write-Host "Now installing LibreOffice $loVersion..." -ForegroundColor Light Magenta
Invoke-WebRequest -Uri $loUrl -OutFile $loInstaller

Write-Host "Polishing LibreOffice installer to make it sparkle!..." -ForegroundColor Light Cyan

#installing all modes e.g. writer, calc, base etc

Write-Host "LibreOffice install has been downloaded globally, you will now see it boot-up on the billboards in your area! (just kidding, it's only installed on your machine)"
Remove-Item -Path $loInstaller -Force

#Draw.io Installer

Write-Host "Now Installing Draw.io..." -ForegroundColor Light Magenta

Write-Host "Installing Draw.io quietly to reduce earrape for all users..." -ForegroundColor Light Magenta

$drawioArguements = "/i `"$drawioInstaller`" /qn ALLUSERS=1"
Start-Process -FilePath "msiexec.exe" -ArguementList $drawioArguements -Wait NoNewWindow

Write-Host "making Draw.io installer squeaky clean!" -ForegroundColor Light Cyan
Remove-Item -Path $drawioInstaller -Force

#Checking installations are present

Write-Host "`Installations Complete, you can now use Python, LibreOffice and Draw.io on everything, including the pieces of paper on your desk!" -ForegroundColor Light Blue

#Done
