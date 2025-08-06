<#
.SYNOPSIS
    This PowerShell script controls the Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled"

.NOTES
    Author          : Nate Spencer
    LinkedIn        : https://www.linkedin.com/in/nathaniel-spencer-133903153/
    GitHub          : https://github.com/natespencer28 
    Date Created    : 2025-08-06
    Last Modified   : 2024-08-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-EP-000310.ps1

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

#>

# YOUR CODE GOES HERE

# Define registry path and value
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\Kernel DMA Protection"
$valueName = "DeviceEnumerationPolicy"
$desiredValue = 0

# Create the registry path if it doesn't exist
if (-not (Test-Path -Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Output "Registry path created: $regPath"
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set the registry value
Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type DWord
Write-Output "Registry value '$valueName' set to $desiredValue (DWORD)"
