# アプリケーション名
##   CheerUP!

# 概要
## アーティスト情報投稿機能
 `応援しているアーティストの情報やSNSなどを投稿できる`
## アーティスト情報一覧表示機能
 `気になるアーティストを一覧の中から探すことができる`
## アーティスト支援機能
 `お気に入りのアーティストにチップを渡すことができ、支援できる`

# 本番環境
  `デプロイ先： https://cheerup-30540.herokuapp.com/`
  `(アプリケーション完成次第、デプロイ先変更の予定)`

# 制作背景
  - 過去に音楽活動をしている際、資金面での調整が大変で、アルバイトをしながら活動していた。
  - 自分だけではなく、本来あてるべき時間の大半を活動にあてることができないのがインディーズアーティストの大多数だと感じた。
  - また、路上ライブをしたりして、広報活動を行っていた際、立ち止まって歌を聞いてくれはするけど、LIVEハウスにLIVEを観に来て下さるまでには至らない方、特にサラリーマン風の方がチップをおいて下さることが度々あった。
  - 自分自身が顧客としてLIVEハウスでLIVEを観に行った際、よかったアーティストさんによかったという意思表示はしたいけども物販を購入するまでには至らないという気持ちがどこかであった。

  `上記のような問題を解決し、音楽活動を後ろからサポートする方法はないかと考え、このアプリケーションを作成しようと考えました。`

# 工夫したポイント
  `音楽活動していた頃、イベントフライヤーも自作することがあったので、今回のアプリケーションで使用するロゴはタブレットを用いて専用のアプリケーションを使い、自作しました。`
  `明るく、希望に満ちたイメージを表現したかったので、イメージカラーをオレンジやイエローにしました。`

# 使用技術(開発環境)
 `Ruby/Ruby on Rails/MySQL/visual studio code`

# 今後実装したい機能
 - 支援機能
 - コメント機能
 - いいね機能
 - グッズ購入機能
 - ジャンル別検索機能
 - 活動拠点別検索機能


# これからについて
 `まずはこのアプリの実装をし、次はメンバーを見つけるマッチングアプリみたいなものを作成したいと考えております。`
 `また音楽活動のみならず、夢を持って活動されている方で資金援助が必要な方、チームメンバーが必要な方はどの分野においてもあると思うので、他の専門分野で同じような技術を転用し、困った方々の課題解決にひとつでも多く関われるよう尽力して参りたいと考えております。`



# DB設計

## テーブル設計
  
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




