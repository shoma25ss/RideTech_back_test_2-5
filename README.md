# SQL テスト（20 問）統合 README

このセットは、以下のスキーマを前提とした **問題ファイル（SQL-01.sql〜SQL-20.sql）** です。先に **DDL（00_schema.sql）** と **テストデータ（01_seed.sql）** を実行して環境を用意してください。想定 DB は `appdb`（スクリプト内で作成/USE）、DB は **MySQL 8** を想定します。

想定スキーマ：

- users(id, name, email, age, status, created_at)
- categories(id, name)
- products(id, name, price, category_id, created_at)
- orders(id, user_id, order_date, total_amount, created_at)
- order_items(id, order_id, product_id, qty, unit_price)
- logs(id, level, message, created_at)

## Docker 環境（docker-compose 利用）

```bash
# 初回起動（バックグラウンド）
docker compose up -d

# ヘルスチェック通過待ち（任意）
docker compose ps

# phpMyAdmin にアクセス（ブラウザ）
# http://localhost:8081  （ユーザー: app / パスワード: app）

# MySQL に入る（アプリユーザーで）
docker compose exec -e MYSQL_PWD=app db mysql -uapp appdb

```

## セットアップ（DDL とテストデータ）

方法 A（推奨：コンテナ内で実行）

```bash
# 00_schema.sql は DB 作成/USE を含むため root で実行
cat 00_schema.sql | docker compose exec -T -e MYSQL_PWD=root db mysql -uroot

# 01_seed.sql は app ユーザーで投入（DB 指定）
cat 01_seed.sql | docker compose exec -T -e MYSQL_PWD=app db mysql -uapp appdb
```

方法 B（ホストから接続して実行）

```bash
# ポート競合がある場合は docker-compose.yml を '13306:3306' に変更し、-P 13306 を使用
MYSQL_PWD=root mysql -h 127.0.0.1 -P 3306 -uroot < 00_schema.sql
MYSQL_PWD=app  mysql -h 127.0.0.1 -P 3306 -uapp  appdb < 01_seed.sql
```

## 各問題の実行（1 ファイルずつ個別に）

- 各 `SQL-XX.sql` を 1 つずつ実行してください（まとめて実行は行わない）。

```bash
# 例：SQL-01.sql を単体実行（推奨：コンテナ内で実行）
docker compose exec -T -e MYSQL_PWD=app db mysql -uapp appdb < SQL-01.sql

# 代替：ホストから接続して実行
MYSQL_PWD=app mysql -h 127.0.0.1 -P 3306 -uapp appdb < SQL-01.sql
```

## 既知のポイント

- 文字コードは **utf8mb4 / utf8mb4_0900_ai_ci**
- 金額は **DECIMAL(12,2)**、日付は **DATE/TIMESTAMP**
- 外部キーは **RESTRICT or CASCADE** を用途別に付与
- `Unused Gadget` は未購入商品（SQL-15 用）
- `orders` の一部は `order_items` が存在しない孤立注文（SQL-20 用）
- 2024 年のデータを厚めに用意（SQL-4/5/7/16/17 向け）
- 2025 年の一部注文は「過去 180 日」判定のための直近サンプル（SQL-19 向け）

## 注意事項

- 一部の問題は **UPDATE / DELETE** を含みます。必要に応じて、同じ WHERE で先に SELECT を実行して対象件数を確認してください。
- 環境が汚れた場合は、再度 DDL/テストデータからやり直してください。

## 片付け（任意）

```bash
MYSQL_PWD="$DB_PASS" mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -e "DROP DATABASE IF EXISTS appdb;"
```
