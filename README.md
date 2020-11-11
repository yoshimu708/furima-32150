# README

## usersテーブル
| Column              | Type       | Options      |
| ------------------- | ---------- | ------------ |
| nickname            | string     | null: false  |
| password            | string     | null: false  |
| email               | string       | null: false  |
| first_name          | string     | null: false  |
| last_name           | string     | null: false  |
| first_name_reading  | string     | null: false  |
| last_name_reading   | string     | null: false  |
| birthday            | string     | null: false  |

### Association

- has_many  :items
- has_many  :purchases


## itemsテーブル
| Column             | Type       | Options      |
| ------------------ | -------    | ------------ |
| name               | string     | null: false  |
| price              | string     | null: false  |
| category           | string     | null: false  |
| brand              | string     | null: false  |
| status             | string     | null: false  |
| shipment source    | string     | null: false  |
| estimated_arrival  | string     | null: false  |

### Association

- belongs_to :user
- has_one    :purchase


## purchasesテーブル
| Column         | Type       | Options      |
| -------------- | -------    | ------------ |
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

### Association

- belongs_to :purchase