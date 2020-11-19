class Artist < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :genre
  belongs_to_active_hash :sub_genre
  belongs_to_active_hash :member
  belongs_to_active_hash :artist_gender

  belongs_to :user

  with_options presence: true do
    validates :name
    validates :description, length: {minimum: 20 }
    validates :social
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :genre_id
    validates :member_id
    validates :artist_gender_id
  end

  with_options format: {/\Ahttp(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w-.\/?%&=]*)?/} do
    validates :social
    validates :url
  end
end
