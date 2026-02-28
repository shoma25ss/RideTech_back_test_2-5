-- SQL-18 エラーログの時間帯別件数
-- 要件:
--   logs から level='error' を対象に、YYYY-MM-DD HH:00 単位で件数
--   時間の昇順で表示
-- ヒント:
--   DATE_FORMAT(created_at, '%Y-%m-%d %H:00')
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。

/* ANSWER HERE */
SELECT
  DATE_FORMAT(created_at, '%Y-%m-%d %H:00') AS hour_unit,
  COUNT(*) AS error_count
FROM
  logs
WHERE
  level = 'error'
GROUP BY
  DATE_FORMAT(created_at, '%Y-%m-%d %H:00')
ORDER BY
  hour_unit ASC;