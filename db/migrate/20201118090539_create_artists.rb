class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name,          null: false
      t.text   :description,   null: false
      t.integer :genre_id,     null: false
      t.integer :sub_genre_id
      t.integer :member_id,    null: false
      t.integer :artist_gender_id, null: false
      t.integer :prefecture_id,null: false
      t.string  :social,       null: false
      t.string  :url
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
