<#
.SYNOPSIS
    This PowerShell script controls the ability of users to supply passwords automatically as part of their remote desktop connection

.NOTES
    Author          : Nate Spencer
    LinkedIn        : 
    GitHub          : https://www.linkedin.com/in/nathaniel-spencer-133903153/
    Date Created    : 2025-08-04
    Last Modified   : 2024-08-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000290

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

#>

# YOUR CODE GOES HERE

# Set the registry path
# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"

# Ensure the registry key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the MinEncryptionLevel to 3 (which typically means "High" encryption)
New-ItemProperty -Path $regPath -Name "MinEncryptionLevel" -PropertyType DWord -Value 3 -Force

Write-Host "Registry value 'MinEncryptionLevel' set to 3 successfully."
