# Installation

1. Open [`src/KSL_Multi_Strategy_Liquidity_Pro.pine`](../src/KSL_Multi_Strategy_Liquidity_Pro.pine) and copy the complete file.
2. In TradingView, open an XAUUSD chart.
3. Select **Pine Editor**, create a blank indicator, select all existing text, and paste the source.
4. Select **Save**, name it `KSL Multi-Strategy Liquidity Pro`, then select **Add to chart**.
5. Select the 5-minute chart. The dashboard row `Chart TF` should show `5 READY`.
6. Keep the `BALANCED` preset for the first replay test.

To use M1, change the chart to 1 minute and enable `Enable optional M1 execution`. If the switch is off, the dashboard tells you to use M5 and execution signals remain disabled.

For alerts, create a TradingView alert and select one of the named engine/sweep/zone conditions. For the compact dynamic signal, score, liquidity target and Stop Loss message, choose **Any alert() function call** and leave dynamic alerts enabled.

If TradingView reports an error, verify that the first line is exactly `//@version=6` and that the entire file was pasted. Record the first compiler error with its line number before changing the code.
