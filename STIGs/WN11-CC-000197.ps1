<#
.SYNOPSIS
    This PowerShell script controls Microsoft consumer experiences suggestions and notifications to users, which may include the installation of Windows Store apps

.NOTES
    Author          : Nate Spencer
    LinkedIn        : https://www.linkedin.com/in/nathaniel-spencer-133903153/
    GitHub          : https://github.com/natespencer28 
    Date Created    : 2025-08-06
    Last Modified   : 2024-08-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000197.ps1

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

#>

# YOUR CODE GOES HERE

# Define registry path and value
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
$valueName = "DisableWindowsConsumerFeatures"
$desiredValue = 1

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
