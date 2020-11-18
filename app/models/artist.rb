class Artist < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :genre
  belongs_to_active_hash :member

  belongs_to :user
end
