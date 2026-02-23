-- SQL-05 集計（売上の月次サマリ）
-- 要件:
--   2024年を対象に、orders の月（YYYY-MM）ごとの total_amount 合計
--   月の昇順で表示
-- ヒント:
--   DATE_FORMAT(order_date, '%Y-%m')
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。

/* ANSWER HERE */
SELECT
  DATE_FORMAT(order_date, '%Y-%m') AS ym,
  SUM(total_amount) AS total
FROM
  orders
WHERE
  YEAR(order_date) = 2024
GROUP BY
  DATE_FORMAT(order_date, '%Y-%m')
ORDER BY
  ym;
