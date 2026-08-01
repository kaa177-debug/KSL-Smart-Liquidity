# KSL Support / Resistance + Order Blocks v3

KSL Support / Resistance + Order Blocks v3 is a clean TradingView Pine Script v6 indicator optimized for Gold (`XAUUSD`). Its default chart shows only the latest confirmed support, latest confirmed resistance, and current order/breaker blocks. The broader ICT/SMC calculations remain available internally for the dashboard and alerts.

## Features

- Previous Daily, H4, and H1 high/low liquidity levels
- BOS, CHoCH, and MSS-style structure changes
- Equal highs/lows and buy-side/sell-side liquidity sweeps
- Fresh and mitigated supply/demand zones with 50% equilibrium
- Fair Value Gaps, Order Blocks, Breaker Blocks, and mitigation state
- Internal 8-point confluence engine retained for dashboard context and alerts
- Dashboard using `POSITIVE`, `NEGATIVE`, and `NEUTRAL`
- Alerts for signals, sweeps, BOS, and CHoCH
- Confirmed-bar decisions and `lookahead_off` higher-timeframe requests
- Minimal default chart: latest support, latest resistance, and current order/breaker blocks only

## Installation

1. Open TradingView and select **Pine Editor**.
2. Copy the contents of [`indicator/KSL_Hybrid_Pro.pine`](indicator/KSL_Hybrid_Pro.pine).
3. Paste it into a new indicator, save it, and choose **Add to chart**.
4. Use an `XAUUSD` chart. M1 or M5 is recommended for entries; the script reads D/H4/H1 context automatically.
5. Create TradingView alerts from any `KSL ...` alert condition you need.

## Signal model

A signal is emitted only when the configured minimum score is reached on a confirmed candle. The model awards points for higher-timeframe alignment, a liquidity sweep, zone interaction, equilibrium rejection, market structure, and a confirmation candle. See [docs/STRATEGY.md](docs/STRATEGY.md) for the exact scoring table.

## Important risk notice

This is a charting and decision-support indicator, not an automated trading system and not financial advice. It does not guarantee results. Backtest and forward-test on a demo account, account for spread/slippage, and define position sizing and maximum loss outside the indicator before using it with real capital.

## Validation

Run the repository check from PowerShell:

```powershell
./scripts/validate.ps1
```

TradingView is the authoritative compiler for Pine Script. After any code change, paste the indicator into the Pine Editor and confirm it compiles under Pine v6.
