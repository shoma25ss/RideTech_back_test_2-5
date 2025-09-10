-- SQL-09 UPDATE（カテゴリで価格改定）
-- 要件:
--   カテゴリ名 'Seasonal' の商品を 5% 値上げ
--   四捨五入して整数に更新する
-- ヒント:
--   UPDATE ... JOIN ... SET price = ROUND(price * 1.05)
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。
-- 安全策: 同じ WHERE 条件で事前に SELECT 件数確認を推奨（誤更新・誤削除防止）。

/* ANSWER HERE */


-- 確認用出力（更新後の値上げ対象商品のみ表示）
SELECT p.id AS product_id, p.name AS product_name, p.price AS updated_price
FROM products p
JOIN categories c ON p.category_id = c.id AND c.name = 'Seasonal'
ORDER BY p.id ASC;