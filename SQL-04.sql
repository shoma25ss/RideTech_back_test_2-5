-- SQL-04 JOIN（ユーザー名付きの注文一覧）
-- 要件:
--   2024年の orders を対象
--   users と結合して 注文ID・ユーザー名・order_date・total_amount を表示
--   order_date の降順で並べる
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。

/* ANSWER HERE */
SELECT
  o.id,
  o.user_id,
  u.name,
  o.order_date,
  o.total_amount
FROM
  orders o
JOIN
  users u ON o.user_id = u.id
WHERE
  YEAR(o.order_date) = 2024
ORDER BY
  o.order_date DESC;
