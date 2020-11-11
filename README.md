# README

## usersテーブル
| Column              | Type       | Options      |
| ------------------- | ---------- | ------------ |
| nickname            | string     | null: false  |
| password            | string     | null: false  |
| email               | text       | null: false  |
| first_name          | string     | null: false  |
| last_name           | string     | null: false  |
| first_name_reading  | string     | null: false  |
| last_name_reading   | string     | null: false  |
| birthday            | string     | null: false  |

### Association

- has_many  :items
- has_many  :purchases
- has_many  :streets


## itemsテーブル
| Column             | Type       | Options      |
| ------------------ | -------    | ------------ |
| product name       | string     | null: false  |
| product price      | string     | null: false  |
| category           | string     | null: false  |
| brand              | string     | null: false  |
| status             | string     | null: false  |
| shipment source    | string     | null: false  |
| estimated_arrival  | string     | null: false  |
| images             | string     | null: false  |

### Association

- belongs_to :user
- has_one    :purchase


## purchasesテーブル
| Column         | Type       | Options      |
| -------------- | -------    | ------------ |
| purchase_goods | string     | null: false  |
| payment_amount | string     | null: false  |
| item_id        | reference  |              |
| user_id        | reference  |              |

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
| prefecture         | string     | null: false  |
| purchases_id       | reference  |              |
| user_id            | reference  |              |

### Association

- belongs_to :user
- belongs_to :purchase