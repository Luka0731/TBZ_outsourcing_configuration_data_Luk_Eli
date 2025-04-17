# Define registry path (HKCU = Current User, so you dont need any sudo rights)
$registryPath = "HKCU:\Software\MyApp\Config"

# Create the registry key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Define config values
Set-ItemProperty -Path $registryPath -Name "DB_HOST" -Value "localhost"
Set-ItemProperty -Path $registryPath -Name "DB_USER" -Value "admin"
Set-ItemProperty -Path $registryPath -Name "DB_PASS" -Value "MeinGeheimesPasswort"

# Define registry path
$registryPath = "HKCU:\Software\MyApp\Config"

# Read all values into a hashtable
$configs = @{}
Get-ItemProperty -Path $registryPath | ForEach-Object {
    $_.PSObject.Properties | ForEach-Object {
        if ($_.Name -ne "PSPath" -and $_.Name -ne "PSParentPath" -and $_.Name -ne "PSChildName" -and $_.Name -ne "PSDrive" -and $_.Name -ne "PSProvider") {
            $configs[$_.Name] = $_.Value
        }
    }
}

# Output configs
$configs.GetEnumerator() | ForEach-Object { Write-Host "$($_.Key): $($_.Value)" }
