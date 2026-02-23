-- SQL-10 DELETE（古いログの分割削除）
-- 要件:
--   logs の created_at < '2024-01-01' を対象に、最大1000件だけ削除
-- ヒント:
--   DELETE ... WHERE ... ORDER BY created_at ASC LIMIT 1000
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。
-- 安全策: 同じ WHERE 条件で事前に SELECT 件数確認を推奨（誤更新・誤削除防止）。

/* ANSWER HERE */
DELETE
FROM logs
WHERE
created_at < '2024-01-01'
ORDER BY
created_at ASC LIMIT 1000;

-- 確認用出力（削除後の残り件数）
SELECT COUNT(*) AS remaining_before_2024
FROM logs
WHERE created_at < '2024-01-01';