# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| uname              | string              | null: false             |
| email              | string              | unique: true            |
| encrypted_password | string              | null: false             |
| birthday           | string              | null: false             |


### Association

* has_many :buys
* has_many :items

## buys table

| Column                           | Type       | Options           |
|----------------------------------|------------|-------------------|
| item                             | references | foreign_key: true |
| user                             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :adress

## adresses table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| buy         | references | foreign_key: true |
| postal      | string     | null: false       |
| prefectures | string     | null: false       |
| municipality| string     | null: false       |
| adress      | string     | null: false       |
| phone       | string     | null: false       |

### Association

- belongs_to :buy
- belongs_to :item

## items table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| image       | string     | null: false       |
| iname       | string     | null: false       |
| description | string     | null: false       |
| category    | string     | null: false       |
| status      | string     | null: false       |
| delivery    | string     | null: false       |
| tiiki       | string     | null: false       |
| day         | string     | null: false       |
| price       | string     | null: false       |
| seller      | string     | null: false       |
| user        | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :adress