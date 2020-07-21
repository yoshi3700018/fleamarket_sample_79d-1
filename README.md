# README

# 79期生teamB 最終課題
- 5人チームでメルカリのクローンサイトを作成する
- 制作期間：2020年7月22日ー8月14日（予定）

# メンバー紹介
## 高橋
- スクラムマスター
- 商品購入確認ページ作成
## 富田
- デプロイ担当
- 商品出品ページ作成
## 橋本
- トップページ
- ヘッダー、フッター作成
## 福元
- 商品詳細ページ作成
## 佐野
- DB設計、ER図
- ReadMe編集
- ユーザー登録、ログイン、マイページ作成

# GEM
- ruby '2.6.5'
- rails, '~> 6.0.0'
- mysql2, '>= 0.4.4'
- puma, '~> 3.11'
- sass-rails, '~> 5'
- webpacker, '~> 4.0'
- turbolinks, '~> 5'
- jbuilder, '~> 2.7'
- bootsnap, '>= 1.4.2'
- byebug', platforms: [:mri, :mingw, :x64_mingw]
- web-console', '>= 3.3.0'
- listen', '>= 3.0.5', '< 3.2'
- spring
- spring-watcher-listen
- capybara', '>= 2.15'
- selenium-webdriver'
- webdrivers
- tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
- pry-rails
- haml-rails", ">= 1.0", '<= 2.0.1'
- font-awesome-sass'
- devise
- carrierwave
- mini_magick
- jquery-rails
- fog-aws

## 多分必要なGEM（view実装しながら検討-未実装)
- payjp
- ransack
- ancestry
- gretel
- omniauth-facebook
- omniauth-google-oauth2
- omniauth-twitter
- factory_bot
- faker
- unicorn

# ER図
[DB設計完了後、画像ファイル挿入予定](https://app.diagrams.net/#G1Yr1YNttI8S3F-aIMpAhlUtLIWoQHrSVL)

# DB設計（暫定：ビューファイル作成しながら仕上げる）

## usersテーブル
|column|type|options|validations|
|------|----|-------|-----------|
|nickname|string|null: false||
|first_name|string|null: false||
|family_name|string|null: false||
|email|string|null: false, unique: true||
|password|string|null: false||
|image|string|||
|profile|text|||
|その他|あれば追加|なければ削除||

Association
- has_many: products
- has_one: address (複数設定するならhas_many)
- has_one: creditcards
- has_many: comments
- has_many: iine


## addressesテーブル
|column|type|options|validations|
|------|----|-------|-----------|
|user_id|references|foreign_key||
|postal_code|string|null: false||
|prefecture|integer|null: false||
|city|string|null: false||
|address_line|string|null: false||
|apartment|string|||
|その他|あれば追加|なければ削除||

Association
- belongs_to :user

## productsテーブル
|column|type|options|validations|
|------|----|-------|-----------|
|user_id|references|foreign_key||
|brand_id|references|foreign_key||
|name|string|null: false, index: true||
|price|integer|null: false||
|explanation|text|null: false||
|condition|integer|null: false||
|prefecture|integer|null: false||
|size|string|null: false||
|postage|string|null: false||
|shipping_date||||

Association
- belongs_to :user
- has_many :comments
- has_many :iine
- belongs_to :categories

## imagesテーブル
|column|type|options|validations|
|------|----|-------|-----------|
|product_id|references|foreign_key||
|image|text|null: false||

Association
- belongs_to: user

## creditcardsテーブル
|column|type|options|validations|
|------|----|-------|-----------|
|card_company|string|null: false||
|card_number|string|null: false||
|card_year|integer|null: false||
|card_month|integer|null: false||
|card_pass|integer|null: false||
|その他|あれば追加|なければ削除||

Association
- belongs_to :user
Note
- gem 'pay.jp'の内容を洗い出してから作成する

## categoriesテーブル
|column|type|options|validations|
|------|----|-------|-----------|
|category_name|string|||
|ancestry|string|||
|その他|あれば追加|なければ削除||

Association
- has_many :products
Note
- gem 'ancestry'の内容を洗い出してから作成する

# 以下、応用実装時検討

## credentialテーブル
|column|type|options|validations|
|------|----|-------|-----------|
|user_id|references|foreign_key||
|provider|string|||
|uid|string|||
|その他|あれば追加|なければ削除||

Associtaion
- belongs_to :user
Note
- sns credentialでログインする機能
- gem 'omniauth'の内容を洗い出して作成する

## commentsテーブル
|column|type|options|validations|
|------|----|-------|-----------|
|product_id|references|foreign_key||
|user_id|references|foreign_key||
|comment|text|||
|その他|あれば追加|なければ削除||

Association
- belongs_to :user
- belongs_to :product
Note
- コメント機能、商品ーユーザーの間に作る

## iineテーブル
|column|type|options|validations|
|------|----|-------|-----------|
|product_id|references|foreign_key||
|user_id|references|foreign_key||
|その他|あれば追加|なければ削除||

Association
- belongs_to :user
- belongs_to :product
Note
- お気に入り機能、商品ーユーザーの間に作る