-- SQL-17 月次売上と累計売上（ウィンドウ関数）
-- 要件:
--   2024年の 月単位売上（orders.total_amount の合計） と その累計を表示
--   出力: month, monthly_total, running_total
-- ヒント:
--   SUM(monthly_total) OVER (ORDER BY month)
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。

/* ANSWER HERE */
SELECT
  month,
  monthly_total,
  SUM(monthly_total) OVER (ORDER BY month) AS running_total
FROM (
  SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS monthly_total
  FROM
    orders
  WHERE
    YEAR(order_date) = 2024
  GROUP BY
    DATE_FORMAT(order_date, '%Y-%m')
) t
ORDER BY
  month;