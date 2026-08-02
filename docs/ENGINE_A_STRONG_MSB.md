# Engine A - Strong MSB

Engine A tracks a structural H4 leg rather than accepting every broken pivot.

For an upside state, an H4 sequence must have lower highs and lower lows. The current lower high is paired with the deepest tracked lower low. A Strong MSB requires a confirmed H4 body close above that tracked lower high and a body at least the configured H4 ATR multiple. A wick or undersized body is Weak MSB and cannot signal.

The downside process mirrors this with higher highs, higher lows, the associated higher low, and a confirmed body close below it.

After the Strong MSB, the engine retains the macro structural range. Its actionable zone prioritizes an active H1 FVG, then the latest H1 displacement order-block/demand-supply candle, then the macro range. A trade requires zone retracement, a recent opposite-side liquidity sweep/reclaim, and M15 direction or a local execution shift. The score threshold is independent from all other engines.

Simplification: Pine cannot reconstruct discretionary leg attribution perfectly from every nested swing without a much larger object/state graph. This implementation deterministically pairs the active confirmed H4 sequence and extreme; the rule is transparent and testable.
