FactoryBot.define do
  factory :user do
    email                  {"aaa@aaa.com"}
    password               {"12345aa"}
    password_confirmation  {password}
    nickname               {"blackhill"}
    first_name             {"ぶらっく"}
    last_name              {"ひる"}
    kana_first             {"ブラック"}
    kana_last              {"ヒル"}
    age_id                 { 2 }
    prefecture_id          { 2 }
    gender_id               { 2 }
  end
end