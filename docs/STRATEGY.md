# Strategy specification

## Purpose

KSL Hybrid Pro identifies probable liquidity-seeking behavior on Gold. H1 is the primary decision timeframe, H4 defines the broader context, M15 refines the setup, and M5 refines execution timing. The strategy is not centered on M1 or high-frequency entries.

## Multi-timeframe context

The indicator derives H4, H1, M15, and M5 bias from confirmed values of close, EMA 20, and EMA 50. A positive bias requires `close > EMA20 > EMA50`; a negative bias requires the reverse. H1 drives the decision, H4 supplies context, and M15/M5 refine it. Higher-timeframe requests use `barmerge.lookahead_off`.

The previous completed candle's high and low are plotted for each higher timeframe:

| Timeframe | Color | Meaning |
| --- | --- | --- |
| Daily | Black | Major external liquidity |
| H4 | Yellow | Session/swing liquidity |
| H1 | Green | Intraday liquidity |

## Market structure and liquidity

- Confirmed pivots form swing highs and lows.
- A confirmed close through a swing in the existing direction is labeled BOS.
- A confirmed close through a swing against the prior structural direction is labeled CHoCH/MSS.
- Two pivots within the ATR-based tolerance form EQH/EQL liquidity.
- A wick through that level followed by a close back inside is a liquidity sweep.

## H1 Candle Range Theory (CRT)

CRT is evaluated only from completed H1 candles. A bullish CRT occurs when the latest closed H1 candle trades below the prior H1 low and closes back inside that prior range; the opposite prior high becomes the displayed target. A bearish CRT is the mirror condition: the latest closed H1 candle trades above the prior H1 high and closes back inside, targeting the prior low. Only the latest confirmed CRT label and target line remain on the chart.

Pivot confirmation introduces an intentional delay of `swingLength` bars. This is the cost of stable, non-repainting swing identification.

## Supply, demand, and ICT objects

The most recent confirmed pivot creates a fresh zone with configurable ATR thickness. A dotted line marks its 50% equilibrium. First interaction marks the zone mitigated; a confirmed close beyond its distal boundary invalidates it.

Three-candle displacement identifies fair value gaps. The final opposite candle before a structure break becomes an order-block candidate. A confirmed close through an order block changes its visual state to a breaker.

## Signal score

BUY and SELL use mirrored conditions:

| Confluence | Points |
| --- | ---: |
| D/H4/H1 directional alignment | 2 |
| Opposing-side liquidity sweep | 2 |
| Price trades in the relevant zone | 1 |
| Rejection beyond zone equilibrium | 1 |
| Structure confirmation | 1 |
| Directional confirmation candle | 1 |

The default threshold is 6/8. A cooldown prevents repeated adjacent signals. The optional UTC session filter can restrict evaluation to the configured London/New York window.

## Non-repainting policy

- Signals require `barstate.isconfirmed` by default.
- Higher-timeframe requests use `lookahead_off`.
- Higher-timeframe liquidity uses the prior completed candle.
- Pivots are used only after their right-side bars have closed.

Changing `Confirmed bars only` weakens these guarantees and is intended for visual experimentation only.

## Known boundaries

- Zone, block, and liquidity recognition are systematic approximations of discretionary ICT/SMC concepts.
- Broker feeds differ; equal-high tolerance and ATR zone thickness may need tuning.
- The indicator does not calculate lot size, stop loss, take profit, or execute orders.
- TradingView object limits require the script to retain only the most relevant live structures.
