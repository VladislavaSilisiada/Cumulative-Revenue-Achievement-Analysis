# Cumulative-Revenue-Achievement-Analysis
**Goal**
To calculate the daily percentage achievement of cumulative revenue against cumulative financial targets (predicts).

**Key Metric:**
Daily Performance Percentage: The running total of actual revenue divided by the running total of predicted revenue, expressed as a percentage.

**Logic in Brief**
1. Combine Data: Use UNION ALL to merge daily revenue targets (DA.revenue_predict) and actual calculated revenue (from DA.product, DA.order, etc.) into one daily list.

2. Calculate Cumulative Sums: Apply Window Functions (SUM() OVER (ORDER BY date)) to get the running totals for both revenue and predicts.

3. Final Calculation: Divide the cumulative revenue by the cumulative predict and multiply by 100.

   The full SQL script is provided below: [`sql/cumulative_revenue.sql`](./sql/cumulative_revenue.sql)
