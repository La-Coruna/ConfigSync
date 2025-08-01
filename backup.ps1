# Create timestamped backup folder
$timestamp = Get-Date -Format "yyyy-MM-dd_HHmmss"
$backupDir = Join-Path -Path $PSScriptRoot -ChildPath "backup\\$timestamp"
New-Item -Path $backupDir -ItemType Directory -Force | Out-Null

Write-Host "Backing up files to: $backupDir" -ForegroundColor Cyan

# Copy mappings.json itself for reference
$mappingsJsonPath = Join-Path -Path $PSScriptRoot -ChildPath "mappings.json"
$backupMappingsPath = Join-Path -Path $backupDir -ChildPath "mappings.json"
Copy-Item $mappingsJsonPath $backupMappingsPath -Force
Write-Host "mappings.json backed up to: $backupMappingsPath"

# Load mapping data
$mappings = Get-Content $mappingsJsonPath | ConvertFrom-Json

# Backup each mapped file
foreach ($entry in $mappings.PSObject.Properties) {
    $sourcePath = [Environment]::ExpandEnvironmentVariables($entry.Value)
    if (Test-Path $sourcePath) {
        $filename = $entry.Name
        $backupPath = Join-Path -Path $backupDir -ChildPath $filename
        Copy-Item $sourcePath $backupPath -Force
        Write-Host "Backed up: $sourcePath -> $backupPath"
    } else {
        Write-Host "Not found: $sourcePath" -ForegroundColor Yellow
    }
}

Write-Host "`nBackup complete." -ForegroundColor Green
