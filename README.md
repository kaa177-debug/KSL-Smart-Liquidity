# KSL Liquidity Entry Assistant v7

KSL Liquidity Entry Assistant v7 is a clean TradingView Pine Script v6 indicator for Gold (`XAUUSD`) and cryptocurrency markets such as `BTCUSD` / `BTCUSDT`. It focuses on liquidity sweeps, order blocks, CRT, support/resistance, and simple post-sweep BUY/SELL decisions scored from 0 to 100.

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
- Arabic `ØªÙ… Ø³Ø­Ø¨ Ø§Ù„Ø³ÙŠÙˆÙ„Ø©` confirmation and a temporary entry zone after each sweep
- Dynamic `BUY n/100` or `SELL n/100` only after a sweep, candle confirmation, and the configured minimum strength

## Installation

1. Open TradingView and select **Pine Editor**.
2. Copy the contents of [`indicator/KSL_Hybrid_Pro.pine`](indicator/KSL_Hybrid_Pro.pine).
3. Paste it into a new indicator, save it, and choose **Add to chart**.
4. Open `XAUUSD`, `BTCUSD`, or `BTCUSDT` on H1, confirm the broader context on H4, then use M15 and M5 only to refine timing.
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
