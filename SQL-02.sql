-- SQL-02 条件と並び替え・件数制限
-- 要件:
--   users から age >= 30 かつ status='active' のユーザー
--   id, name, age, created_at を取得
--   created_at の降順で 5件
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。

/* ANSWER HERE */
SELECT
id,name,age,created_at
FROM
users
WHERE
age >= 30
AND status='active'
ORDER BY
created_at DESC
LIMIT 5;