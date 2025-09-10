-- SQL-19 休眠ユーザーのステータス更新
-- 要件:
--   過去180日間注文がないユーザーの status を 'inactive' に更新
-- ヒント:
--   NOT EXISTS または MAX(order_date) を利用
--   WHERE status <> 'inactive' を併用可
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。
-- 安全策: 同じ WHERE 条件で事前に SELECT 件数確認を推奨（誤更新・誤削除防止）。

/* ANSWER HERE */


-- 確認用出力（更新後のステータスが inactive のユーザー一覧）
SELECT id, name, status
FROM users
WHERE status = 'inactive'
ORDER BY id ASC
LIMIT 50;