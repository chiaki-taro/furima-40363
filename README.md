# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day_yyyy     | date   | null: false |
| birth_day_mm       | date   | null: false |
| birth_day_dd       | date   | null: false |

### Association

- has_many :items
- has_one :address


## items テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| explanation      | string     | null: false                    |
| category_id      | enum       | null: false                    |
| condition_id     | enum       | null: false                    |
| postage_payer    | enum       | null: false                    |
| prefecture_id    | enum       | null: false                    |
| preparation_days | enum       | null: false                    |

### Association

- belongs_to :user
- has_one :purchase

## addresses テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| post_code        | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     | null: false                    |
| phone_number     | string     | null: false                    |

### Association

- belongs_to :user
- has_many :purchases

## purchases テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| item             | references | null: false, foreign_key: true |
| address          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :address
