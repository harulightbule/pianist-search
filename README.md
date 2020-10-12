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
- has_many : entries
- has_many :rooms, through: entries
- has_many :messages


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

# rooms テーブル

| Column   | Type      | Options                        |
| user     | reference | null: false, foreign_key: true |

### Association

- has_many :entries
- has_many :users, through: entries
- has_many :messages



# entries テーブル

| Column   | Type      | Options                        |
| user     | reference | null: false, foreign_key: true |
| room     | reference | null: false, foreign_key: true |

### Association

belongs_to :room
belongs_to :user

# messages テーブル

| Column   | Type      | Options                        |
| user     | reference | null: false, foreign_key: true |
| rooms    | reference | null: false, foreign_key: true |
| message  | text      | null: false                    |

### Association

belongs_to :user
belongs_to :room

# comments テーブル

| Column   | Type      | Options                        |
| user     | reference | null: false, foreign_key: true |
| pianist  | reference | null: false, foreign_key: true |
| comment  | text      | null: false                    |

### Association

belongs_to :user
belongs_to :pianist
