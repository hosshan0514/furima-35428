# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| ----------------| ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column         | Type        | Options     |
| -------------- | ----------- | ----------- |
| image          | text        | null: false |
| name           | string      | null: false |
| information    | text        | null: false |
| category       | string      | null: false |
| state          | string      | null: false |
| postage        | string      | null: false |
| region         | string      | null: false |
| shipping_date  | string      | null: false |
| price          | string      | null: false |
| user           | references  | null: false |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column             | Type       | Options      |
| ------------------ | ---------- | ------------ |
| card_number        | string      | null: false |
| card_expiry_month  | string      | null: false |
| card_expiry_year   | string      | null: false |
| card_cvc           | string      | null: false |
| postal_code        | string      | null: false |
| state              | string      | null: false |
| city               | string      | null: false |
| street_address     | string      | null: false |
| suburb             | string      | null: false |
| phone_number       | string      | null: false |
| user               | references  | null: false |
| item               | references  | null: false |

### Association

- belongs_to :user
- belongs_to :order
