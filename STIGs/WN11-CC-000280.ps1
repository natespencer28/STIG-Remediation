<#
.SYNOPSIS
    This PowerShell script controls the ability of users to supply passwords automatically as part of their remote desktop connection

.NOTES
    Author          : Nate Spencer
    LinkedIn        : 
    GitHub          : https://www.linkedin.com/in/nathaniel-spencer-133903153/
    Date Created    : 2025-08-03
    Last Modified   : 2024-08-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000280

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

#>

# YOUR CODE GOES HERE

# Define the registry path and value details
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$valueName = "fPromptForPassword"
$valueData = 1

# Check if the registry path exists; if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -PropertyType DWord -Force

# Output confirmation
Write-Output "Registry value '$valueName' set to '$valueData' at '$registryPath'."
