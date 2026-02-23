-- SQL-08 各ユーザーの直近注文（ウィンドウ関数）
-- 要件:
--   各ユーザーの直近1件の注文を取得
--   出力: user_id, last_order_id, last_order_date, last_total_amount
-- ヒント:
--   ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date DESC, id DESC)
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。

/* ANSWER HERE */
SELECT
  user_id,
  last_order_id,
  last_order_date,
  last_total_amount
FROM (
  SELECT
    user_id,
    id AS last_order_id,
    order_date AS last_order_date,
    total_amount AS last_total_amount,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date DESC, id DESC) AS rn
  FROM orders
) t
WHERE rn = 1;
