$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$pinePath = Join-Path $repoRoot 'src\KSL_Multi_Strategy_Liquidity_Pro.pine'
$requiredDocs = @(
    'README.md',
    'CHANGELOG.md',
    'docs\IMPLEMENTATION_PLAN.md',
    'docs\STRATEGY_RULES.md',
    'docs\INSTALLATION.md',
    'docs\TESTING_CHECKLIST.md',
    'docs\NON_REPAINTING.md',
    'docs\ENGINE_A_STRONG_MSB.md',
    'docs\ENGINE_B_CANDLE_REJECTION.md',
    'docs\ENGINE_C_ZONE_SWEEP.md',
    'docs\ENGINE_D_RANGE_EXPANSION.md'
)

if (-not (Test-Path -LiteralPath $pinePath)) {
    throw "Missing Pine source: $pinePath"
}
foreach ($relative in $requiredDocs) {
    if (-not (Test-Path -LiteralPath (Join-Path $repoRoot $relative))) {
        throw "Missing required project file: $relative"
    }
}

$pine = Get-Content -LiteralPath $pinePath -Raw
if (-not $pine.StartsWith('//@version=6')) { throw 'Pine source must start with //@version=6.' }
if ($pine -notmatch 'indicator\("KSL Multi-Strategy Liquidity Pro"') { throw 'Unexpected indicator title.' }
if ($pine -match 'barmerge\.lookahead_on') { throw 'lookahead_on is forbidden.' }
if ($pine -match '\[\s*-\d+') { throw 'Negative historical indexing is forbidden.' }
if ($pine -match 'request\.security_lower_tf') { throw 'Lower-timeframe security call is not expected.' }

$securityLines = [regex]::Matches($pine, '(?m)^.*request\.security\(.*$')
if ($securityLines.Count -ne 4) { throw "Expected exactly 4 cached request.security calls; found $($securityLines.Count)." }
foreach ($match in $securityLines) {
    if ($match.Value -notmatch 'barmerge\.lookahead_off') {
        throw "request.security call without lookahead_off: $($match.Value)"
    }
}

foreach ($engine in 'enableA','enableB','enableC','enableD','engineABuy','engineBBuy','engineCBuy','engineDBuy','engineASell','engineBSell','engineCSell','engineDSell') {
    if ($pine -notmatch [regex]::Escape($engine)) { throw "Missing engine token: $engine" }
}
foreach ($group in 1..15) {
    if ($pine -notmatch [regex]::Escape(('string G_' + @('GENERAL','TF','SR','LIQ','FVG','ZONES','A','B','C','D','RISK','DASH','ALERT','VIS','DEBUG')[$group - 1]))) {
        throw "Missing settings group $group."
    }
}

$alertCount = [regex]::Matches($pine, 'alertcondition\(').Count
if ($alertCount -lt 16) { throw "Expected at least 16 alertcondition calls; found $alertCount." }
if ($pine -notmatch 'math\.abs\(bestBuyScore - bestSellScore\) < 15') { throw 'Missing 15-point conflict rule.' }
if ($pine -notmatch 'barstate\.isconfirmed') { throw 'Missing confirmed execution-bar guard.' }
if ($pine -notmatch 'time\[1\]') { throw 'HTF pack does not expose a closed timestamp.' }
if ($pine -match '"Entry"|"TP1"|"TP2"|"TP3"') { throw 'Dashboard must not contain Entry or fixed TP rows.' }
if ($pine -notmatch 'table\.new\(f_dash_pos\(dashboardPosition\), 2, 7') { throw 'Expected compact 7-row dashboard.' }
if ($pine -notmatch 'dashboardPosition = input\.string\("Bottom Right"') { throw 'Dashboard must default to Bottom Right.' }
if ($pine -notmatch 'var line stopLossLine') { throw 'Expected one current Stop Loss line.' }

$openParen = ([regex]::Matches($pine, '\(')).Count
$closeParen = ([regex]::Matches($pine, '\)')).Count
$openSquare = ([regex]::Matches($pine, '\[')).Count
$closeSquare = ([regex]::Matches($pine, '\]')).Count
if ($openParen -ne $closeParen) { throw "Unbalanced parentheses: $openParen/$closeParen" }
if ($openSquare -ne $closeSquare) { throw "Unbalanced square brackets: $openSquare/$closeSquare" }

Write-Output 'KSL repository validation passed.'
Write-Output "Pine lines: $((Get-Content -LiteralPath $pinePath).Count)"
Write-Output "request.security calls: $($securityLines.Count) (all lookahead_off)"
Write-Output "alertcondition calls: $alertCount"
Write-Output 'Four independent engines and required documentation found.'
