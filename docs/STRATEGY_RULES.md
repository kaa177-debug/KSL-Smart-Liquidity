# Strategy Rules

## Shared sequence

The script caches closed Daily, H4, H1 and M15 data, then evaluates the execution candle on M5 (or manually enabled M1). Confirmed pivots supply structure and active levels. FVGs and H1 displacement candles supply zones. Liquidity candidates come from confirmed swings, equal highs/lows and previous D/H4/H1 extremes.

An execution signal is eligible only when the chart timeframe is M5, or M1 with the M1 switch enabled, and the execution candle is confirmed.

## OR aggregation

Each engine owns its prerequisites, score and cooldown. No engine needs another engine to trigger. The aggregation is logically:

```text
finalBuy  = engineABuy  OR engineBBuy  OR engineCBuy  OR engineDBuy
finalSell = engineASell OR engineBSell OR engineCSell OR engineDSell
```

`Show Only Multi-Engine Opportunities` suppresses a one-engine final direction but does not alter the engines' internal testability.

## Structure and bias

Confirmed pivots are classified by comparing the latest and previous pivot values. An advancing high/low pair is positive; a declining pair is negative. EMA20/EMA50 alignment is a fallback when the pivot pair is incomplete. A valid Strong MSB overrides the H4 base state while it remains structurally valid.

Daily is the primary alignment source, followed by H4. H1 refines the dashboard context and M15 refines setup confirmation.

## Support/resistance and liquidity

Only the latest active pivot support and resistance from D/H4/H1 are drawn. A wick does not invalidate a level. A confirmed close beyond the configured ATR buffer does. The liquidity display keeps only the nearest candidate above and below price. When that candidate changes it receives a new internal ID, and the same ID cannot sweep twice.

## FVG

A bullish FVG exists when candle 3 low is above candle 1 high. A bearish FVG exists when candle 3 high is below candle 1 low. The latest bullish and bearish gap on each supported timeframe is retained. The chosen mitigation threshold removes it.

## Zones

The H1 zone is the full high-low range of the last opposing H1 candle immediately before a confirmed H1 displacement body. State progresses through fresh, touched, partially mitigated, mitigated, or invalidated. Only the nearest H1 demand and supply zones are retained.

## Conflict, score and levels

When BUY and SELL engines trigger together, the strongest score in each direction is compared. A difference of at least 15 selects the stronger side. Otherwise the result is `CONFLICT - WAIT` and no BUY/SELL final alert fires.

The best engine supplies the structural invalidation. TP1 and TP2 are risk multiples. TP3 prefers nearest directional liquidity beyond TP2 and otherwise uses its configured fallback multiple.

## Presets

- Conservative: larger sweep buffer and higher engine score thresholds.
- Balanced: supplied defaults.
- Aggressive: smaller sweep buffer and lower score thresholds.
- Custom: uses each visible custom threshold.

Presets intentionally change only critical confirmation thresholds; all settings remain visible and auditable.
