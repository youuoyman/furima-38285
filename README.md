# README

##　usersテーブル
| Column            | Type      | Options                    |
|-------------------|-----------|----------------------------|
| nickname          | string    | null: false, unique: true  |
| email             | string    | null: false, unique: true  |
| encrypted_password| string    | null: false                |
| last-name         | string    | null: false                |
| first-name        | string    | null: false                |
| last-name-kana    | string    | null: false                |
| first-name-kana   | string    | null: false                |
| birthday          | date      | null: false                |


### Asociation
- has_many :orders
- has_many :exhibits 




## itemsテーブル
| Column                   | Type      | Options                        |
|--------------------------|-----------|--------------------------------| 
| item-image               | string    | null: false                    |
| item-name                | string    | null: false                    |
| item-info                | string    | null: false                    |
| item-category            | string    | null: false                    |
| item-sales-status        | string    | null: false                    |
| item-shipping-fee-status | string    | null: false                    |
| item-prefecture          | string    | null: false                    |
| item-scheduled-delivery  | string    | null: false                    |
| item-price               | integer   | null: false                    |
| add-tax-price            | string    | null: false                    |
| profit                   | string    | null: false                    |
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
| portal-code     | string     | null: false                   |
| prefecture      | integer    | null: false                   |
| city            | string     | null: false                   |
| addresses       | string     | null: false                   |
| building        | string     |                               |
| phone-number    | string     | null: false                   |

### Asociation
- belongs_to :order

