Write-Host "Starting sync..." -ForegroundColor Cyan
$mappings = Get-Content "./mappings.json" | ConvertFrom-Json

foreach ($entry in $mappings.PSObject.Properties) {
    $source = Join-Path -Path $PSScriptRoot -ChildPath "configs\$($entry.Name)"
    $target = [Environment]::ExpandEnvironmentVariables($entry.Value)

    Write-Host "Copying: $source -> $target"

    if (Test-Path $target) {
        Copy-Item $target "$target.bak" -Force
        Write-Host "Backup created: $target.bak"
    }

    Copy-Item $source $target -Force
}

Write-Host "Sync completed."