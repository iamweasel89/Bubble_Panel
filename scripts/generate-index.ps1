# scripts/generate-index.ps1

$root = Join-Path (Get-Location) "bubbles"
$outputDir = Join-Path (Get-Location) "panel"
$output = Join-Path $outputDir "index.json"

$result = @{}

Get-ChildItem $root -Directory | ForEach-Object {
    $folder = $_.Name
    $files = Get-ChildItem $_.FullName -Filter *.md | Select-Object -ExpandProperty Name
    if ($files.Count -gt 0) {
        $result[$folder] = $files
    }
}

$result | ConvertTo-Json -Depth 5 | Out-File -Encoding UTF8 $output

Write-Host "index.json regenerated."
