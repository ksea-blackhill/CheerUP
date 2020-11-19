class SubGenre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'J-POP' },
    { id: 3, name: 'Rock' },
    { id: 4, name: 'アイドル' },
    { id: 5, name: 'アニソン' },
    { id: 6, name: '演歌' },
    { id: 7, name: 'EDM' },
    { id: 8, name: 'アコースティック' },
    { id: 9, name: 'R&B' },
    { id: 10, name: 'Jazz' },
    { id: 11, name: 'ソウル' },
    { id: 12, name: 'Dance & Vocal' },
    { id: 13, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :artists
end
