# Define registry path and value
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"
$valueName = "NoGPOListChanges"
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
