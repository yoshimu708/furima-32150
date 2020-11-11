# README

## usersテーブル
| Column              | Type       | Options      |
| ------------------- | ---------- | ------------ |
| nickname            | string     | null: false  |
| encrypted_password  | string     | null: false  |
| email               | string     | null: false  |
| first_name          | string     | null: false  |
| last_name           | string     | null: false  |
| first_name_reading  | string     | null: false  |
| last_name_reading   | string     | null: false  |
| birthday            | date       | null: false  |

### Association

- has_many  :items
- has_many  :purchases


## itemsテーブル
| Column               | Type       | Options      |
| -------------------- | -------    | ------------ |
| name                 | string     | null: false  |
| price                | string     | null: false  |
| category_id          | integer    | null: false  |
| brand                | string     | null: false  |
| status_id            | integer    | null: false  |
| shipment_source_id   | integer    | null: false  |
| estimated_arrival_id | integer    | null: false  |
| delivery_fee_id      | integer    | null: false  |
| explanation          | text       | null: false  |


### Association

- belongs_to :user
- has_one    :purchase


## purchasesテーブル
| Column         | Type       | Options      |
| -------------- | -------    | ------------ |
| item_id        | integer    | null: false  |
| user_id        | integer    | null: false  |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :street


## streetsテーブル
| Column             | Type       | Options      |
| ------------------ | -------    | ------------ |
| phone_number       | string     | null: false  |
| post_code          | string     | null: false  |
| adress             | string     | null: false  |
| municipal_district | string     | null: false  |
| building           | string     |              |
| prefecture_id      | integer    | null: false  |
| purchases_id       | integer    | null: false  |

### Association

- belongs_to :purchase