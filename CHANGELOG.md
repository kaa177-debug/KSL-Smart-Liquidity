# Changelog

## 1.0.3 - 2026-08-02

- Changed the default dashboard position to Bottom Right so it does not cover the indicator legend.

## 1.0.2 - 2026-08-02

- Reduced the dashboard to seven tiny decision rows.
- Combined liquidity status/target, signal/engine, and confidence/score.
- Clean Chart Mode now hides line and zone text.
- Made demand, supply and range fills nearly transparent.

## 1.0.1 - 2026-08-02

- Reduced the dashboard from 24 rows to 11 decision-focused rows.
- Removed Entry and TP1/TP2/TP3 from the dashboard, chart lines and dynamic alert.
- Replaced historical trade-level objects with one current structural Stop Loss line.
- Kept recent liquidity sweep and nearest directional liquidity target as the primary target context.

## 1.0.0 - 2026-08-02

- Created the original Pine Script v6 `KSL Multi-Strategy Liquidity Pro` project.
- Added closed-candle Daily/H4/H1/M15 context and M5/optional-M1 execution.
- Added active support/resistance, liquidity IDs and sweeps, multi-timeframe FVGs, and H1 displacement zones.
- Added independent Strong MSB, Candle Rejection, Zone Sweep and Range Expansion engines.
- Added per-engine scoring, OR aggregation, 15-point conflict resolution and three-star confidence.
- Added latest active Entry/Invalidation/TP1/TP2/TP3, compact labels, dashboard, alerts and optional Debug Mode.
- Added installation, strategy, engine, non-repainting and testing documentation.
- Added compile-oriented static repository validation.
