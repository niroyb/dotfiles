# Run in Admin Powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Confirm
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
choco feature enable -n allowGlobalConfirmation