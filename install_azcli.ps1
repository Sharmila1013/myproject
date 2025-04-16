# Create the directory if it doesn't exist
if (-Not (Test-Path -Path "C:\Temp")) {
    New-Item -Path "C:\Temp" -ItemType Directory
}

# Download the Azure CLI installer
Invoke-WebRequest -Uri "https://aka.ms/installazurecliwindowsx64" -OutFile "C:\Temp\AzureCLI.msi"

# Silent install Azure CLI
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i C:\Temp\AzureCLI.msi /quiet /norestart" -NoNewWindow -Wait

# Add Azure CLI to PATH
$env:Path += ";C:\Program Files\Microsoft SDKs\Azure\CLI2\wbin"
[System.Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::Machine)

az --version
