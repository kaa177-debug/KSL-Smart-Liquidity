# Engine D - Range Expansion

Engine D examines the configured 12-40 completed bars before the execution candle. A valid range must stay within ATR height bounds, show repeated reactions near both boundaries, and avoid excessive start-to-end directional travel.

A breakout requires a confirmed body close outside the stored boundary with the configured ATR body size. The optional volume filter compares volume with its 20-bar average when volume is available.

Entry methods are breakout close, breakout FVG, and the default retest. A bullish retest trades below/touches the prior range high and closes back above it; the bearish rule is symmetrical. Range height is retained for scoring and measured-move context. The dashboard trade targets use risk multiples and nearest liquidity.

Visual simplification: the active range box supplies the high/low boundary and shades the full range. Premium/discount and equilibrium are not drawn as separate permanent lines in Clean Chart Mode, preventing unnecessary objects; the engine still computes the full range height.
