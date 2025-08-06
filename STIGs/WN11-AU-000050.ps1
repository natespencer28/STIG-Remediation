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
