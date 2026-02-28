-- SQL-12 ユーザー別の注文回数（上位5）
-- 要件:
--   2024年の orders を対象に、ユーザーごとの注文回数を集計
--   回数降順→user_id昇順で上位5件
--   出力: user_id, name, order_count
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。

/* ANSWER HERE */
SELECT
u.id AS user_id,
u.name,
COUNT(o.id) AS order_count
FROM
orders o
JOIN
users u ON o.user_id = u.id
WHERE
YEAR(o.order_date) = 2024
GROUP BY
o.user_id,
u.name
ORDER BY
order_count DESC,
user_id ASC
limit 5;