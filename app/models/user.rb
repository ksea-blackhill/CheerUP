class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :artists
  has_many :supports
       
  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :kana_first
    validates :kana_last
    validates :email, uniqueness: true
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-zA-Z\d]{6,50}+\z/.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX }
  end
       
  with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :first_name
    validates :last_name
  end
       
  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :kana_first
    validates :kana_last
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :age_id
    validates :gender_id
  end

end
