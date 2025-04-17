
# Pfad zur .env-Datei
$envFilePath = "C:\Users\lukag\Documents\GitHub\TBZ_outsourcing_configuration_data_Luk_Eli\03-attachments\01-cofing_files\config.env"

# Überprüfen, ob die Datei existiert
if (-not (Test-Path $envFilePath)) {
    Write-Error "Fehler: .env-Datei nicht gefunden unter '$envFilePath'!"
    exit 1
}

# Datei einlesen und Variablen setzen
Get-Content $envFilePath | ForEach-Object {
    if ($_ -match "^(?<key>[^=#]+)=(?<value>.*)$") {
        $key = $matches['key'].Trim()
        $value = $matches['value'].Trim()
        
        # Umgebungsvariable setzen (nur für diese Session)
        [Environment]::SetEnvironmentVariable($key, $value, "Process")
        Write-Host "[OK] Geladen: $key"
    }
}

# Beispiel: Verwendung der geladenen Variablen
Write-Host "`n--- Konfiguration ---"
Write-Host "Datenbank-Host: $($env:DB_HOST)"
Write-Host "Datenbank-User: $($env:DB_USER)"
Write-Host "Datenbank-Passwort: $($env:DB_PASS)"

