$ErrorActionPreference = 'Stop'

$repositoryRoot = Split-Path -Parent $PSScriptRoot
$indicatorPath = Join-Path $repositoryRoot 'indicator\KSL_Hybrid_Pro.pine'
$readmePath = Join-Path $repositoryRoot 'README.md'
$strategyPath = Join-Path $repositoryRoot 'docs\STRATEGY.md'

$requiredFiles = @($indicatorPath, $readmePath, $strategyPath)
foreach ($file in $requiredFiles) {
    if (-not (Test-Path -LiteralPath $file -PathType Leaf)) {
        throw "Missing required file: $file"
    }
}

$source = Get-Content -LiteralPath $indicatorPath -Raw
$requiredPatterns = @(
    '//@version=6',
    'indicator\("KSL Hybrid Pro"',
    'barmerge\.lookahead_off',
    'alertcondition\(buySignal',
    'alertcondition\(sellSignal',
    'Daily High',
    'Bullish CHoCH',
    'FRESH DEMAND',
    'BULL FVG',
    'Signal Strength'
)

foreach ($pattern in $requiredPatterns) {
    if ($source -notmatch $pattern) {
        throw "Indicator is missing required construct: $pattern"
    }
}

if ($source -match 'lookahead_on') {
    throw 'Potential repaint risk: lookahead_on is not allowed.'
}

Write-Host 'KSL repository validation passed.' -ForegroundColor Green

