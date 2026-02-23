-- SQL-14 特定カテゴリを購入したユーザー一覧
-- 要件:
--   カテゴリ名 'Beverages' の商品を一度でも購入したユーザーの id, name
--   重複を除き、id 昇順
-- ヒント:
--   orders → order_items → products → categories を結合
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。

/* ANSWER HERE */
SELECT DISTINCT
  u.id,
  u.name
FROM
  users u
JOIN
  orders o ON o.user_id = u.id
JOIN
  order_items oi ON oi.order_id = o.id
JOIN
  products p ON p.id = oi.product_id
JOIN
  categories c ON c.id = p.category_id
WHERE
  c.name = 'Beverages'
ORDER BY
  u.id ASC;