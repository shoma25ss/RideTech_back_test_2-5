-- SQL-07 商品別売上ランキング（JOIN＋集計）
-- 要件:
--   2024年を対象に、order_items × products で商品ごとの売上金額（qty*unit_price の合計）
--   売上降順で上位10件を表示
--   出力: product_id, product_name, revenue
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。

/* ANSWER HERE */
SELECT
  p.id AS product_id,
  p.name AS product_name,
  SUM(oi.qty * oi.unit_price) AS revenue
FROM
  order_items oi
JOIN
  orders o ON oi.order_id = o.id
JOIN
  products p ON oi.product_id = p.id
WHERE
  YEAR(o.order_date) = 2024
GROUP BY
  p.id
ORDER BY
  revenue DESC
LIMIT 10;
