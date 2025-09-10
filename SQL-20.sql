-- SQL-20 アイテムが存在しない注文の削除（データ整備）
-- 要件:
--   order_items が1件も無い orders の行を削除
-- ヒント:
--   DELETE o FROM orders o LEFT JOIN order_items oi ON ... WHERE oi.id IS NULL
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。
-- 安全策: 同じ WHERE 条件で事前に SELECT 件数確認を推奨（誤更新・誤削除防止）。

/* ANSWER HERE */


-- 確認用出力（削除後の残り件数）
SELECT COUNT(*) AS remaining_orphan_orders
FROM orders o
LEFT JOIN order_items oi ON oi.order_id = o.id
WHERE oi.id IS NULL;