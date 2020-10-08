# README

# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| family_name      | string | null: false |
| name             | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name_kana | string | null: false |
| name_kana        | string | null: false |
| birthday         | string | null: false |
| purchase         | string | null: false , foreign_key: true |

### Association

- has_many :purchases
- has_many :items

##  items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| category | string | null: false |
| status   | string | null: false |
| burden   | string | null: false |
| area     | string | null: false |
| date     | string | null: false |
| price    | string | null: false |
| comments | string | null: false |
| user     | string | null: false , foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| Postal_code  | string     | null: false                    |
| Prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| Building_name| string     |                                |
| phone_number | string     | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
