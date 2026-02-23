-- SQL-01 基本SELECT
-- 要件:
--   users から id, name を取得
--   created_at の降順で先頭10件のみ
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。

/* ANSWER HERE */
SELECT
  id,
  name
FROM
  users
ORDER BY
  created_at DESC
LIMIT 10;