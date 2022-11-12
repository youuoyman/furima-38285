# README

##　usersテーブル
| Column            | Type      | Options                    |
|-------------------|-----------|----------------------------|
| nickname          | string    | null: false                |
| email             | string    | null: false, unique: true  |
| encrypted_password| string    | null: false                |
| last_name         | string    | null: false                |
| first_name        | string    | null: false                |
| last_name_kana    | string    | null: false                |
| first_name_kana   | string    | null: false                |
| birthday          | date      | null: false                |


### Asociation
- has_many :orders
- has_many :items 




## itemsテーブル
| Column                   | Type      | Options                        |
|--------------------------|-----------|--------------------------------| 
| item_name                | string    | null: false                    |
| item_info                | text      | null: false                    |
| item_category_id         | integer   | null: false                    |
| status_id                | integer   | null: false                    |
| shipping_fee_id          | integer   | null: false                    |
| prefecture_id            | integer   | null: false                    |
| delivery_id              | integer   | null: false                    |
| item_price               | integer   | null: false                    |
| user                     | references| null: false, foreign_key: true |

### Asociation
- belongs_to :user
- has_one :order


## ordersテーブル
| Column          | Type       | Options                       |
|-----------------|------------|-------------------------------|
| user            | references | null: false, foreign_key: true|
| item            | references | null: false, foreign_key: true|


### Asociation
- belongs_to :user
- belongs_to :item
- has_one :payment


## paymentsテーブル
| Column          | Type       | Options                       |
|-----------------|------------|-------------------------------|
| order           | references | null: false, foreign_key: true|
| portal_code     | string     | null: false                   |
| prefecture_id   | integer    | null: false                   |
| city            | string     | null: false                   |
| addresses       | string     | null: false                   |
| building        | string     |                               |
| phone_number    | string     | null: false                   |

### Asociation
- belongs_to :order

