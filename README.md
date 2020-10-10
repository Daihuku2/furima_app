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
| birthday         | date   | null: false |
| purchase         | string | null: false |

### Association

- has_many :purchases
- has_many :items

##  items テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| category_id | integer    | null: false |
| status_id   | integer    | null: false |
| burden_id   | integer    | null: false |
| area_id     | integer    | null: false |
| date_id     | integer    | null: false |
| price       | integer    | null: false |
| comments    | text       | null: false |
| items_name  | string     | null: false |
| user        | references | null: false , foreign_key: true |

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
- has_one :address

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building_name| string     |                                |
| phone_number | string     | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
