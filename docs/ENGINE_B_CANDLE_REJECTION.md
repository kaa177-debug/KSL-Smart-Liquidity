# Engine B - Candle Rejection

Engine B first requires a meaningful location unless mid-range rejection is explicitly enabled. Locations include active D/H4/H1 support/resistance, H1 demand/supply, active higher-timeframe FVG, or a liquidity sweep.

The selectable pattern is Pin Bar, Engulfing, Outside Bar, Displacement Rejection, Sweep and Close Back Inside, or Any Valid Rejection. The default is Sweep and Close Back Inside. Wick percentages and minimum ATR size are configurable.

A valid rejection candle becomes a pending event. It signals only on a later confirmed execution candle that breaks the rejection high/low, produces a micro structure shift, or satisfies either method according to settings. Pending rejection events expire after the configured sweep/entry window and cannot repeatedly signal.
