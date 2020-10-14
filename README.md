# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| name       | string | null: false |
| email      | string | null: false |
| password   | string | null: false |

### Association

- has_one :pianist
- has_many :comments


## pianists テーブル

| Column   | Type   | Options     |
| -------- | -----  | ----------  |
| school   | text   | null: false |
| repert   | text   | null: false |
| area     | string | null: false |
| money    | text   | null: false |
| message  | text   |             |
| video    | text   |             |

### Association

- belongs_to :user
- has_many :comments



# comments テーブル

| Column   | Type      | Options           |
| user     | reference | foreign_key: true |
| pianist  | reference | foreign_key: true |
| text     | text      |                   |

### Association

belongs_to :user
belongs_to :pianist
