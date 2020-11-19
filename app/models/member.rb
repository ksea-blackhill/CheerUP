class Member < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ソロ' },
    { id: 3, name: 'デュオ' },
    { id: 4, name: 'グループ' },
  ]

  include ActiveHash::Associations
  has_many :artists
end
