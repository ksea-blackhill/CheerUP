class ArtistForm
  include ActiveModel::Model
  attr_accessor :token,:comment,:price,:support_id,:user_id,:artist_id

  with_options presence: true do
    validates :token
    validates :price,numericality: { only_integer: true }
    validates :comment,length: {minimum: 20 }
  end

  validates :price,numericality: { greater_than_or_equal_to: 500, less_than_or_equal_to: 1_000_000 }

  def save
    support = Support.create(user_id: user_id, artist_id: artist_id)
    Comment.create(price: prece, comment: comment, support_id: support.id)
  end
end