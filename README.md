# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| uname              | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |


### Association

* has_many :buys
* has_many :items

## buys table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| buyer                               | string     | null: false       |
| item_id                             | references | foreign_key: true |
| user_id                             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :adress

## adresses table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| buy_id      | references | foreign_key: true |
| item_id     | references | foreign_key: true |
| user_id     | references | foreign_key: true |
| adress      | string     | null: false       |

### Association

- belongs_to :buy
- belongs_to :item

## items table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| iname       | string     | null: false       |
| category    | string     | null: false       |
| price       | string     | null: false       |
| seller      | string     | null: false       |
| user_id     | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :adress