-- SQL-06 サブクエリ or LEFT JOIN（未購入ユーザー）
-- 要件:
--   一度も注文していないユーザーの id, name, email を id 昇順で取得
-- ヒント:
--   NOT EXISTS または LEFT JOIN ... WHERE o.id IS NULL
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。

/* ANSWER HERE */
SELECT
  u.id,
  u.name,
  u.email
FROM
  users u
WHERE
  NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.user_id = u.id
  )
ORDER BY
  u.id;
