$ErrorActionPreference = "Stop"

# function Test-Administrator  
# {  
#     $user = [Security.Principal.WindowsIdentity]::GetCurrent();
#     (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)  
# }

# Test-Administrator
# if ($? -eq $False){
#     Write-Host "This script must be run with admin priviledges to create symlinks."
#     exit
# }

# Write-Host $(Test-Administrator)

# exit

if ($args.count -eq 1){
    $layout = $args[0]
}
else {
    $layout = ".\windows\layout.csv"
}

$csv = Import-Csv $layout
foreach($row in $csv)
{
    # Link should not exist
    # Add /D switch for folders
    $link = [Environment]::ExpandEnvironmentVariables($row.link)
    $target = Resolve-Path([Environment]::ExpandEnvironmentVariables($row.target))
    Write-Host "Creating link $($link) pointing to $($target)"
    cmd /c mklink $link $target
}
