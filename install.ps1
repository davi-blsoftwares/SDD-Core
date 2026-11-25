$ErrorActionPreference = "Stop"
$destinos = @(
    "$env:USERPROFILE\.agents\skills",
    "$env:USERPROFILE\.claude\skills"
)

foreach ($base in $destinos) {
    New-Item -ItemType Directory -Force -Path $base | Out-Null
    Get-ChildItem ".\skills\sdd-core-*" -Directory | ForEach-Object {
        $target = Join-Path $base $_.Name
        Copy-Item $_.FullName -Destination $target -Recurse -Force
    }
}

Write-Host "Skills sdd-core instaladas/atualizadas com sucesso!" -ForegroundColor Green