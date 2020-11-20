FactoryBot.define do
  factory :artist do
    name              {"Bluckhill"}
    description       {"Sample,sample,sample,sample,sample,sample"}
    prefecture_id     { 2 }
    genre_id          { 2 }
    sub_genre_id      { 2 }
    artist_gender_id  { 2 }
    member_id         { 2 }
    social            {"https://twitter.com/aaaa3aaa?s=11"}
    url               {"http://footrock.jp/"}
    association       :user
  end
end
