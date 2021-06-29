
| アプリケーション名   | furimaアプリ                                                                                           |
| アプリケション概要   | 新規登録, ログイン, ログアウト, 商品出品, 出品商品編集, 出品商品削除,                                           |
|                   | 出品商品閲覧, 出品商品詳細閲覧, 商品購入, 購入者情報入力, Sold Out表示                                         |
| URL               | https://furima-35428.herokuapp.com/                                                                   |
| テスト用アカウント   | 出品者アカウント：mail = 111@111, pass = 111aaa                                                          |
|                   | 購入者アカウント：mail = 222@222, pass = 222aaa                                                          |
| 利用方法           | 初めに新規登録をし、ログインをしていただくと商品の出品、購入ができます。また、出品した商品の編集や、削除もできます。      |
| データベースの設計   | 以下に示します。                                                                                         |
| ローカルでの操作方法 | ターミナル上で、hoshinoshouhei1@hoshinoshouheinoMacBook-Air furima-35428 % のディレクトリで、rails sを記述し、|
|                   | ブラウザ上でlocalhost:3000を開くと起動します。
（Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code）                                                                   |

# テーブル設計

## users テーブル

| Column             | Type   | Options                     |
| -------------------| ------ | ------------ | ------------ |
| nickname           | string | null: false  |              |
| email              | string | null: false  | unique: true |
| encrypted_password | string | null: false  |              |
| last_name          | string | null: false  |              |
| first_name         | string | null: false  |              |
| last_name_kana     | string | null: false  |              |
| first_name_kana    | string | null: false  |              |
| birthday           | date   | null: false  |              |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type        | Options                         |
| ----------------- | ----------- | ----------- | ----------------- |
| name              | string      | null: false |                   |
| information       | text        | null: false |                   |
| category_id       | integer     | null: false |                   |
| state_id          | integer     | null: false |                   |
| postage_id        | integer     | null: false |                   |
| region_id         | integer     | null: false |                   |
| shipping_date_id  | integer     | null: false |                   |
| price             | integer     | null: false |                   |
| user              | references  | null: false | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ----------- | ----------------- |
| user               | references  | null: false | foreign_key: true |
| item               | references  | null: false | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order

## orders テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ----------- | ----------------- |
| postal_code        | string     | null: false |                   |
| region_id          | integer    | null: false |                   |
| city               | string     | null: false |                   |
| street_address     | string     | null: false |                   |
| suburb             | string     |             |                   |
| phone_number       | string     | null: false |                   |
| purchase           | references | null: false | foreign_key: true |

### Association

- belongs_to :purchase