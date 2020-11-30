class CreateSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :supports do |t|
      t.references :user, foreign_key: true, null: false
      t.references :artist,foreign_key: true, dependent: :destroy
      t.timestamps
    end
  end
end
