# KSL H1 Liquidity + CRT + Order Blocks v5

KSL H1 Liquidity + CRT + Order Blocks v5 is a clean TradingView Pine Script v6 indicator optimized for Gold (`XAUUSD`). H1 is the primary decision timeframe, H4 provides context, and M15/M5 refine setup and timing. Its default chart shows the latest confirmed support/resistance, current order/breaker blocks, liquidity sweeps, and confirmed H1 CRT events.

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
- Minimal default chart: latest support, latest resistance, current order/breaker blocks, sweeps, and the latest confirmed CRT target
- Explicit `BSL SWEEP` / `SSL SWEEP` labels without historical liquidity lines
- Confirmed H1 Candle Range Theory events with one opposite-side CRT target line
- Consistent `POSITIVE` / `NEGATIVE` naming for order blocks and breakers

## Installation

1. Open TradingView and select **Pine Editor**.
2. Copy the contents of [`indicator/KSL_Hybrid_Pro.pine`](indicator/KSL_Hybrid_Pro.pine).
3. Paste it into a new indicator, save it, and choose **Add to chart**.
4. Start analysis on `XAUUSD` H1, confirm the broader context on H4, then use M15 and M5 only to refine timing.
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
