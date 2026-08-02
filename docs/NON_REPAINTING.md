# Non-Repainting Design

## Guarantees implemented

- Pine Script v6.
- Every `request.security()` call uses `barmerge.lookahead_off`.
- Confirmed HTF expressions use historical index `[1]`; incomplete HTF candles never become confirmed structure, FVG or bias inputs.
- Execution signals require a confirmed chart candle by default.
- Pivots use `ta.pivothigh/ta.pivotlow` with equal left/right strengths and are consumed only after confirmation.
- No future or negative indexing is used.
- No `request.security_lower_tf()` is used.
- Confirmed signal labels are created once and are never repositioned.
- Liquidity IDs, engine cooldowns and event states prevent duplicate signal spam.

## Delays that must be expected

A pivot at the apparent turning candle is unknown until `rightBars` later candles close. Because HTF tuples additionally use the previous closed HTF value, an HTF update is intentionally conservative. The display can therefore lag the turning point; claiming zero delay would be false.

## What non-repainting does not mean

It does not guarantee a profitable signal, an exact broker fill, protection from gaps/slippage, or identical candles across data vendors. A currently open M5/M1 candle can visibly change, but it cannot generate a confirmed signal until its close when the default setting is retained.

## Verification method

Use TradingView Replay, advance one candle at a time, record signal bars, reload the chart, and compare. Also compare `Any alert() function call` events with the final labels at candle close.
