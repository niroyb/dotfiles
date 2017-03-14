# Run in Admin Powershell

# Stop on error
$ErrorActionPreference = "Stop"

# Allow to run downloaded scripts
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Confirm

# Install chocolatey
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

# Disable chocolatey download confirmation
choco feature enable -n allowGlobalConfirmation