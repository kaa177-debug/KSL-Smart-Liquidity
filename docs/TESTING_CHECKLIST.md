# Testing Checklist

## Compile and load

- Paste the complete source into a new Pine v6 editor tab.
- Confirm the script compiles and adds to XAUUSD without an object-limit error.
- Confirm `Chart TF` says `5 READY` on M5 and `USE M5` on unsupported timeframes.
- Confirm M1 signals are disabled until the M1 switch is enabled.

## XAUUSD M5 manual replay

- Load at least three months of XAUUSD M5 history.
- Start Replay before a known London or New York expansion.
- Step bar by bar and verify that a BUY/SELL label appears only after candle close.
- Verify D/H4/H1 values change only after a new closed HTF pack arrives.
- Verify a pivot label is delayed by its configured right-side strength and never moves afterward.
- Verify one liquidity level cannot produce repeated sweep labels.
- Verify wick-only H4 structure breaks never produce Strong MSB.
- Toggle each engine off separately and confirm its status becomes `DISABLED`.
- Enable `Show Only Multi-Engine Opportunities` and confirm single-engine labels are suppressed.
- Find a two-sided bar or use Debug Mode to inspect conflict behavior; a score difference below 15 must show `CONFLICT - WAIT`.
- Verify a new active signal replaces the previous Stop Loss line and invalidation removes it.

## Engine spot checks

- A: H4 tracked leg, strong body close, retrace, sweep/reclaim, M15 or local shift.
- B: meaningful location, selected candle pattern, later confirmation break/shift.
- C: active zone, internal liquidity sweep, reclaim, mode-specific structure confirmation.
- D: qualified range, body breakout and selected close/FVG/retest entry.

## Live parity

- Run the same symbol/feed in paper trading for several sessions.
- Compare alerts against labels after candle close.
- Reload the chart and confirm historical labels remain at the same bars.
- Repeat on a second XAUUSD feed to understand broker-feed sensitivity.
