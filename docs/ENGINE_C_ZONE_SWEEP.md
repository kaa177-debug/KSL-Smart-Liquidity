# Engine C - Zone Sweep

Engine C operates independently inside an active H1 demand/supply zone or higher-timeframe FVG. Confirmed local swings, equal highs/lows and previous higher-timeframe extremes provide the internal liquidity map.

The bullish path is demand arrival, sell-side sweep, close back above the swept level, reclaim, and mode-specific confirmation. The bearish path is symmetrical.

- Aggressive: confirmed sweep and reclaim; local shift contributes score but is not mandatory.
- Balanced: sweep, reclaim and local M5/M1 structure shift.
- Conservative: Balanced rules plus M15 directional alignment and zone midpoint reclaim.

The same liquidity ID cannot sweep twice, and the same engine observes its own cooldown.
