# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| uname              | string              | null: false             |
| email              | string              | unique: true,null: false|
| encrypted_password | string              | null: false             |
| birthday           | string              | null: false             |
| sei                | string              | null: false             |
| mei                | string              | null: false             |
| sei_huri           | string              | null: false             |
| mei_huri           | string              | null: false             |


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
- belongs_to :items

## adresses table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| buy         | references | foreign_key: true |
| postal      | string     | null: false       |
| prefectures_id | integer | null: false       |
| municipality| string     | null: false       |
| adress      | string     | null: false       |
| phone       | string     | null: false       |
| building    | string     | null: false       |

### Association

- belongs_to :buy

## items table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| iname       | string     | null: false       |
| description | text       | null: false       |
| category_id | integer    | null: false       |
| status_id   | integer    | null: false       |
| delivery_id | integer    | null: false       |
| tiiki_id    | integer    | null: false       |
| day_id      | integer    | null: false       |
| price       | integer    | null: false       |
| user        | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buy