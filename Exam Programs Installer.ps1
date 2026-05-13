#Exam Programs Installer
Write-Host"-----Exam Programs Installer-----"

$version = "3.14.5"
$url = "https//:python.org$version/python-$version-amd64.exe"
$installPath = "$env:TEMP\python-installer.exe"
$targetDir = "$env:ProgramFiles\Python314"

Write-Host "Intalling Python $version..."
Invoke-WebRequest -Uri $url -OutFile $installPath

Write-Host "Installing python Globally (not literally, just on the machine XD)!"
$installArgs = /quiet InstallAllUsers=1 PrependPath=1 TargetDir= `"$targetDir`" Include_test=0"
Start-Process -FilePath $installerPath -ArguementList $installArgs -Wait - NoNewWindow

Write-Host "Washing the installer to make it shiny..."
Remove-Item -Path $installerPath -Force

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "Global Python installation complete!"
python --version

Write-Host "Now intalling Global Pytohn Packages..."

$pipArgs = "-m pip install --upgrade pandas matplotlib"
