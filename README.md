# bms

2013 年に作った、個人用の書籍(主にシリーズ物の巻数)管理 Web アプリです。Ruby on Rails 3.2 製で、「どの本を何巻まで持っているか」を記録する用途でした。

## ステータス

**アーカイブ相当(メンテナンスなし)**です。コミットは 2013 年 3 月〜4 月が最後で、依存する Rails 3.2.13 などは既にサポートが終了しています。セキュリティ更新も行っていないため、**そのまま公開サーバーで動かすことは推奨しません**。当時の実装の記録として残しています。

## 機能(コードで確認できる範囲)

- ログイン / ユーザー登録(Devise)。ユーザー名またはメールアドレスでログイン可能
- 書籍の一覧・登録・編集・削除(ログインユーザー自身の書籍のみ一覧表示)
  - 項目: 名前、読み(カタカナ必須)、巻数(整数)、備考、完結フラグ
  - 名前・読みの重複登録を禁止
- 一覧の「+」リンクで巻数を 1 つ増やす
- 一覧は完結フラグ、読みの順に並び替え
- 書籍一覧の CSV ダウンロード(文字コードは Shift_JIS)
- 画面文言は日本語(rails-i18n)

## 技術スタック

- Ruby on Rails 3.2.13
- データベース: MySQL(`mysql2`)
- 認証: Devise
- アセット: sass-rails / coffee-rails / uglifier / jquery-rails
- JavaScript ランタイム: therubyracer

## セットアップ

Rails 3.2 が動作する古い Ruby 環境と MySQL が必要です(現行の Ruby では動作しない可能性が高いです)。

```bash
bundle install
# config/database.yml のユーザー・パスワード等を自分の環境に合わせる
rake db:create db:migrate
rake db:seed     # 任意。db/ 配下の CSV から初期データを投入(下記注意を参照)
rails server
```

ブラウザで `http://localhost:3000/` を開くとログイン画面に移動します(ルートは書籍一覧)。

## 設定項目

- `config/database.yml`: development / test / production の接続設定(DB 名は `bms_development` / `bms_test` / `bms`)
- `config/initializers/secret_token.rb`: セッション署名用の鍵
- いずれも**公開リポジトリのサンプル値**として扱い、実際に利用する場合は自分の値に置き換えてください。

## 構成

```
app/controllers/  books_controller.rb(書籍 CRUD、+ 操作、CSV 出力), sessions_controller.rb
app/models/       book.rb, user.rb
app/views/        books/, devise/(日本語化したログイン等の画面), layouts/
config/           routes.rb, initializers/ ほか
db/               migrate/(2013 年 3 月のマイグレーション), schema.rb, seeds.rb, books.csv, users.csv
test/             Rails 雛形のままのテスト(内容は未整備)
```

## 注意事項

- `db/seeds.rb` は `db/users.csv` と `db/books.csv` を読み込み、既存の User / Book を**全削除**してから投入します。実行前にデータのバックアップを取ってください。
- `public/assets/` にプリコンパイル済みアセットがコミットされています。
- ライセンスは未設定です。
