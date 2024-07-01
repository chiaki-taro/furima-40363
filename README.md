# README

# アプリケーションの概要
ユーザーを登録すると商品を出品できるようになります。</br>
自身が出品した商品は、編集と削除をすることができます。</br>
他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。</br>

## URL
### AWS EC2によるデプロイ（停止中）
http://13.112.69.203/

## TOP画面
![スクリーンショット 2024-07-01 12 43 34](https://github.com/chiaki-taro/furima-40363/assets/142806100/5f94815c-54f9-4da9-9bff-04a8505b80ed)

## ユーザー登録機能
ユーザー登録することで出品・購入できるようになります。（ユーザー登録していない人でも出品している商品を見ることは可能です。）
![スクリーンショット 2024-07-01 13 33 22](https://github.com/chiaki-taro/furima-40363/assets/142806100/cf62b79c-0b7a-44a2-8b3b-5893bddf2486)

## 商品出品機能
商品画像を選択し、商品情報や販売したい金額を入力すると、出品することができます。（JavaScriptで販売手数料が表示されるようになっています。）
![スクリーンショット 2024-07-01 12 45 59](https://github.com/chiaki-taro/furima-40363/assets/142806100/8ac92799-6ec9-46f6-b7cd-a4933523dab9)

## 商品編集機能
自分が出品した商品について、編集することができます。</br>
その際に、ユーザーの手間を省くため出品時の情報が表示されるようになっています。
![スクリーンショット 2024-07-01 13 36 23](https://github.com/chiaki-taro/furima-40363/assets/142806100/dcbdd884-c8d4-4aec-9b4a-893b6dc06b1f)

![スクリーンショット 2024-07-01 13 36 32](https://github.com/chiaki-taro/furima-40363/assets/142806100/667bdf10-fae6-454e-99b2-dd26e81d0be9)

## 商品の削除機能
出品中であった商品を削除ボタンを押すことで商品を削除することができます。

## 商品の購入機能
出品者以外であれば、商品を購入することができます。</br>
カード情報と配送先を入力すると購入できます。（JavaScriptとフォームオブジェクトを使用し、トークン化したカード情報をPAY.JPに送付しつつ、カード情報がアプリケーションのデータベースに保存されないように設計しています。）
![商品購入](https://github.com/chiaki-taro/furima-40363/assets/142806100/4613d3a1-4d14-46a7-b2b1-fbe9321d2651)

## 商品一覧画面
購入済みの商品には「sold out」と表示されます。
![スクリーンショット 2024-07-01 12 45 07](https://github.com/chiaki-taro/furima-40363/assets/142806100/c6121830-f0b6-4cef-9e56-c587c3011736)

# テーブル設計

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
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| preparation_id   | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order

## addresses テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| order            | references | null: false, foreign_key: true |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |

### Association

- belongs_to :order

## orders テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address
