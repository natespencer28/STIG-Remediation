<#
.SYNOPSIS
    This PowerShell script ensures that tandard user accounts must not be granted elevated privileges.

.NOTES
    Author          : Nate Spencer
    LinkedIn        : 
    GitHub          : https://www.linkedin.com/in/nathaniel-spencer-133903153/
    Date Created    : 2025-08-06
    Last Modified   : 2024-08-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

#>

# YOUR CODE GOES HERE

# Define registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"

# Create the registry key if it doesn't exist
if (-not (Test-Path -Path $registryPath)) {
    New-Item -Path $registryPath -Force
    Write-Output "Created registry key: $registryPath"
} else {
    Write-Output "Registry key already exists: $registryPath"
}

# Set the DWORD value
New-ItemProperty -Path $registryPath -Name "AlwaysInstallElevated" -Value 0 -PropertyType DWORD -Force
Write-Output "Set AlwaysInstallElevated to 0 (REG_DWORD)"

