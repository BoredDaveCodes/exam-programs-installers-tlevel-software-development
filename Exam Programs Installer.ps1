# Exam Programs Installer
# Please ensure that you are in administrator mode of PowerShell for this to work

Write-Host "-----Exam Programs Installer-----"

# 1. Python Installer
$version = "3.12.2" # Using a valid, existing version for stability
$url = "python.org$version/python-$version-amd64.exe"
$installPath = "$env:TEMP\python-installer.exe"
$targetDir = "$env:ProgramFiles\Python312"

Write-Host "Downloading Python $version..." -ForegroundColor Magenta
Invoke-WebRequest -Uri $url -OutFile $installPath

Write-Host "Installing Python Globally..." -ForegroundColor Magenta
$installArguments = "/quiet InstallAllUsers=1 PrependPath=1 TargetDir=`"$targetDir`" Include_test=0"
Start-Process -FilePath $installPath -ArgumentList $installArguments -Wait -NoNewWindow

Write-Host "Washing the installer to make it shiny..." -ForegroundColor Cyan
Remove-Item -Path $installPath -Force

# Environment Refresh (Safe method)
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "Global Python installation complete!" -ForegroundColor DarkMagenta
& python --version

Write-Host "Now installing Global Python Packages..." -ForegroundColor Magenta
$pipArguments = "-m pip install --upgrade pandas matplotlib numpy"
Start-Process -FilePath "python.exe" -ArgumentList $pipArguments -Wait -NoNewWindow
Write-Host "Packages installed successfully!" -ForegroundColor DarlMagenta


# 2. LibreOffice Installer
$loVersion = "24.2.1"
$loUrl = "documentfoundation.org$loVersion/win/x86_64/LibreOffice_${loVersion}_Win_x86-64.msi"
$loInstaller = "$env:TEMP\LibreOffice.msi"

Write-Host "Downloading LibreOffice $loVersion..." -ForegroundColor Magenta
Invoke-WebRequest -Uri $loUrl -OutFile $loInstaller

Write-Host "Installing LibreOffice quietly..." -ForegroundColor Magenta
$loArguments = "/i `"$loInstaller`" /qn /norestart"
Start-Process -FilePath "msiexec.exe" -ArgumentList $loArguments -Wait -NoNewWindow

Write-Host "Polishing LibreOffice installer to make it sparkle!..." -ForegroundColor Cyan
Remove-Item -Path $loInstaller -Force


# 3. Draw.io Installer
# Using the official direct GitHub msi download link
$drawioUrl = "github.com"
$drawioInstaller = "$env:TEMP\drawio.msi"

Write-Host "Downloading Draw.io..." -ForegroundColor Magenta
Invoke-WebRequest -Uri $drawioUrl -OutFile $drawioInstaller

Write-Host "Installing Draw.io quietly..." -ForegroundColor Magenta
$drawioArguments = "/i `"$drawioInstaller`" /qn ALLUSERS=1"
Start-Process -FilePath "msiexec.exe" -ArgumentList $drawioArguments -Wait -NoNewWindow

Write-Host "Making Draw.io installer squeaky clean!" -ForegroundColor Cyan
Remove-Item -Path $drawioInstaller -Force

# Checking installations are present
Write-Host "Installations Complete! You can now use Python, LibreOffice, and Draw.io." -ForegroundColor Blue
