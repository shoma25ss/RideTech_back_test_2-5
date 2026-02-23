-- SQL-11 ステータス別ユーザー数
-- 要件:
--   users を status ごとに集計し、status, cnt を cnt 降順で表示
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。

/* ANSWER HERE */
SELECT
  status,
  COUNT(*) AS cnt
FROM
  users
GROUP BY
  status
ORDER BY
  cnt DESC;
