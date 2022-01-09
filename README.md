# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false , unique: true|
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| item_name         | string      | null: false                    |
| item_description  | text        | null: false                    |
| category          | integer     | null: false                    |
| condition         | integer     | null: false                    |
| shipping_charges  | integer     | null: false                    |
| shipping_area     | integer     | null: false                    |
| ship_date         | integer     | null: false                    |
| price             | integer     | null: false                    |
| user              | references  | null: false, foreign_key: true |
 imageはActivestorageで実装するため含まず

### Association

- has_one :purchase_records
- belongs_to :users

## purchase_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| price  | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_one :shopping_addresses
- belongs_to :users
- belongs_to :items

## shopping_addresses テーブル

| Column       | Type     | Options     |
| ------------ | -------- | ----------- |
| postcode     | string   | null: false |
| prefecture   | string   | null: false |
| city         | string   | null: false |
| block        | string   | null: false |
| building     | string   |             |
| phone_number | string   | null: false |

### Association

- belongs_to :purchase_records