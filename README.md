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
| state_id           | integer    | null: false |                   |
| city               | string     | null: false |                   |
| street_address     | string     | null: false |                   |
| suburb             | string     |             |                   |
| phone_number       | string     | null: false |                   |
| purchase           | references | null: false | foreign_key: true |

### Association

- belongs_to :purchase