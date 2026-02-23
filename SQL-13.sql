-- SQL-13 ユーザー別平均注文額
-- 要件:
--   各ユーザーの平均注文額（orders.total_amount の平均）を算出し、avg_amount 降順で表示
--   注文がないユーザーは除外可
--   出力: user_id, name, avg_amount
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。

/* ANSWER HERE */
SELECT
u.id AS user_id,
u.name,
AVG(o.total_amount) AS avg_amount
FROM
users u
JOIN
orders o ON o.user_id = u.id
GROUP BY
o.user_id,
u.name