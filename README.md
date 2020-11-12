# テーブル設計
  
## usersテーブル

| Column        | Type    | Options       |
| ------------- | ------- | ------------- |
| first_name    | string  | null : false  |
| last_name     | string  | null : false  |
| kana_first    | string  | null : false  |
| kana_last     | string  | null : false  |
| email         | string  | null : false  |
| password      | string  | null : false  |
| nickname      | string  | null : false  |
| gender_id     | integer | null : false  |
| prefecture_id | integer | null : false  |
| age_id        | integer | null : false  |


  ### Association

  - has_many  :artists
  - has_many  :supports


  ## artistsテーブル

| Column        | Type       | Options          |
| ------------- | ---------- | ---------------- |
| name          | string     | null : false     |
| description   | text       | null : false     |
| genre_id      | integer    | null : false     |
| member_id     | integer    | null : false     |
| base_id       | integer    | null : false     |
| social        | string     | null : false     |
| user          | references | foreign_key :true|

  ### Association

  - belongs_to        :user
  - belongs_to        :support
  - has_one_attached  :image
  - has_one_attached  :video


  ## supportsテーブル

| Column               | Type       | Options          |
| -------------------- | ---------- | ---------------- |
| user                 | references | foreign_key :true|
| artist               | references | foreign_key :true|

  ### Association

  - belongs_to :user
  - belongs_to :artist
  - has_one    :comment


  ## commentsテーブル

| Column               | Type       | Options          |
| -------------------- | ---------- | -----------------|
| comment              | text       | null : false     |
| payment              | references | foreign_key :true|

  ### Association

  belongs_to   :support

”


”


