# KSL Multi-Strategy Liquidity Pro

An original TradingView Pine Script v6 overlay for XAUUSD scalping and intraday analysis. It combines four transparent strategy engines with **OR logic**: any enabled engine can produce an opportunity after satisfying its own full rule set. It is an indicator, not an automated trading bot, and it never places orders.

Main source: [`src/KSL_Multi_Strategy_Liquidity_Pro.pine`](src/KSL_Multi_Strategy_Liquidity_Pro.pine)

## Timeframe hierarchy

- Daily: primary context, major structure, previous-day liquidity and Daily FVG.
- H4: trading bias and Strong MSB state.
- H1: refined support/resistance, liquidity, FVG and the nearest supply/demand/order-block candle.
- M15: directional setup confirmation and internal structure.
- M5: default execution and final signal generation.
- M1: optional aggressive execution; disabled until `Enable optional M1 execution` is enabled.

All higher-timeframe packs use closed values (`[1]`) through `request.security(..., barmerge.lookahead_off)`. A newly confirmed HTF fact therefore appears with deliberate confirmation delay.

## Independent engines

- **Engine A - Strong MSB:** tracks the H4 structural leg associated with the active extreme, requires a body close beyond it, then waits for retracement, liquidity sweep/reclaim and M15/M5 confirmation.
- **Engine B - Candle Rejection:** detects a selected rejection pattern only at meaningful support, resistance, zone, FVG or swept-liquidity locations, then waits for confirmation.
- **Engine C - Zone Sweep:** detects a sweep and reclaim inside an active H1 demand/supply or HTF FVG, with aggressive, balanced or conservative execution modes.
- **Engine D - Range Expansion:** qualifies a 12-40 bar consolidation and trades a confirmed breakout close, breakout FVG, or default breakout-retest.

The final direction is `A OR B OR C OR D`. Two-sided signals on the same candle are resolved by the strongest engine scores. A difference below 15 produces `CONFLICT - WAIT` and no directional alert.

## Shared map

- D/H4/H1 confirmed pivot support and resistance, invalidated only by a buffered confirmed close.
- Nearest active buy-side and sell-side liquidity assembled from confirmed swings, equal highs/lows and previous D/H4/H1 highs/lows.
- One sweep per tracked liquidity ID.
- Standard three-candle FVGs on D/H4/H1/M15/M5 with wick, 50%, or full-fill mitigation.
- One active H1 demand and supply zone from the last opposing candle before confirmed displacement.
- A current qualified range, liquidity target and latest structural Stop Loss.

## Scores and confidence

Each engine has a 0-100 rule score and an independent minimum. `BALANCED` is the default preset. Confidence is shown mainly in the dashboard:

- `★`: one engine.
- `★★`: two engines, or one engine aligned with Daily/H4.
- `★★★`: three engines, two aligned engines, or a complete high-quality confluence.

## Dashboard

The tiny 7-row status panel defaults to the bottom-right and reports symbol/timeframe, compact D/H4/H1 bias, recent liquidity sweep and target, active signal/engine, strength and Stop Loss. Clean Chart Mode hides text from level lines and makes zones nearly transparent.

## Use on XAUUSD M5

1. Open XAUUSD and select 5 minutes.
2. Paste the source into TradingView Pine Editor and select **Add to chart**.
3. Start with `BALANCED`; keep `Clean Chart Mode` on.
4. Treat `WAIT` as no setup. A BUY/SELL is confirmed only after the execution candle closes.
5. Use the displayed invalidation as a structural reference, not as a guarantee against slippage or a later sweep.

For M1, switch the chart to 1 minute and enable `Enable optional M1 execution`. M1 is more sensitive to spread and noise; test separately.

## Non-repainting limitations

Confirmed signals do not move. Pivots necessarily appear `rightBars` candles after the actual turning point. HTF values are intentionally delayed because incomplete HTF candles are excluded. This design reduces repainting; it does not remove market latency, broker-feed differences, gaps, or execution risk. See [`docs/NON_REPAINTING.md`](docs/NON_REPAINTING.md).

## Documentation

- [Installation](docs/INSTALLATION.md)
- [Implementation plan and phase record](docs/IMPLEMENTATION_PLAN.md)
- [Strategy rules](docs/STRATEGY_RULES.md)
- [Testing checklist](docs/TESTING_CHECKLIST.md)
- [Non-repainting](docs/NON_REPAINTING.md)
- [Engine A](docs/ENGINE_A_STRONG_MSB.md)
- [Engine B](docs/ENGINE_B_CANDLE_REJECTION.md)
- [Engine C](docs/ENGINE_C_ZONE_SWEEP.md)
- [Engine D](docs/ENGINE_D_RANGE_EXPANSION.md)

Run the repository checks on Windows with:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/validate.ps1
```

## Trading disclaimer

This project is informational, rule-based software. It is not financial advice and does not guarantee results. Validate it in TradingView Replay and paper trading before risking capital.
