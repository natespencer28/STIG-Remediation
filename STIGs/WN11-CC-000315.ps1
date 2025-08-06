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

# Temporarily bypass execution policy for this session
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

# Define the registry path and value
$regHive = "HKLM:"
$regPath = "Software\Policies\Microsoft\Windows\Installer"
$fullPath = Join-Path -Path $regHive -ChildPath $regPath

# Create the registry path if it doesn't exist
if (-not (Test-Path -Path $fullPath)) {
    New-Item -Path $fullPath -Force | Out-Null
    Write-Output "Created registry path: $fullPath"
} else {
    Write-Output "Registry path already exists: $fullPath"
}

# Set the policy value to 0 (Disabled)
New-ItemProperty -Path $fullPath -Name "AlwaysInstallElevated" -PropertyType DWORD -Value 0 -Force | Out-Null
Write-Output "Set 'AlwaysInstallElevated' to 0 (Disabled) in Local Group Policy via registry"

# Optional: Force Group Policy to refresh
# gpupdate /force
