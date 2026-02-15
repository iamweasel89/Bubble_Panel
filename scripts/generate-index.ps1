# scripts/generate-index.ps1

 = Join-Path (Get-Location) "bubbles"
 = Join-Path (Get-Location) "panel"
 = Join-Path  "index.json"

 = @{}

Get-ChildItem  -Directory | ForEach-Object {
     = .Name
     = Get-ChildItem .FullName -Filter *.md | Select-Object -ExpandProperty Name
    if (.Count -gt 0) {
        [] = 
    }
}

 | ConvertTo-Json -Depth 3 | Out-File -Encoding UTF8 

Write-Host "index.json regenerated."
