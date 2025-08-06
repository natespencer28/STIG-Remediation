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
    STIG-ID         : WN11-CC-000050.ps1

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

#>

# YOUR CODE GOES HERE

# Define the registry path and property
$regPath = "HKLM:\System\CurrentControlSet\Control\Lsa"
$propertyName = "SCENoApplyLegacyAuditPolicy"
$desiredValue = 1

# Check if the property exists and has the desired value
$currentValue = Get-ItemProperty -Path $regPath -Name $propertyName -ErrorAction SilentlyContinue

if ($null -eq $currentValue -or $currentValue.$propertyName -ne $desiredValue) {
    # Set the registry value to enable the setting
    Set-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue
    Write-Output "'Force audit policy subcategory settings to override audit policy category settings' has been ENABLED."
} else {
    Write-Output "The setting is already enabled."
}
