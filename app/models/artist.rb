class Artist < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :genre
  belongs_to_active_hash :sub_genre
  belongs_to_active_hash :member
  belongs_to_active_hash :artist_gender

  belongs_to :user
  has_one_attached :image
  has_one_attached :video

  with_options presence: true do
    validates :image
    validates :name, uniqueness: true
    validates :description, length: {minimum: 20 }
    validates :social,url: true
    validates :video
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :genre_id
    validates :member_id
    validates :artist_gender_id
  end

  validates :url, url: { allow_blank: true }

  validate :image_checker, if: :was_attached?
  validate :video_checker, if: :video_was_attached?

  private
  def image_checker
    extension = ['image/png','image/PNG','image/jpeg']
    unless image.content_type.in?(extension)
      errors.add(:image, 'は画像を添付してください')
    end
  end

  def was_attached?
    self.image.attached?
  end

  def video_checker
    extension = ['video/quicktime','video/mp4']
    unless video.content_type.in?(extension)
      errors.add(:video, 'は動画を添付してください')
    end
  end

  def video_was_attached?
    self.video.attached?
  end

end
