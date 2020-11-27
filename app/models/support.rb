class Support < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  has_one :comment
end
