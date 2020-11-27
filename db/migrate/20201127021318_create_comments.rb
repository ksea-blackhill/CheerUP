class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :price, null:false
      t.text   :comment,null:false
      t.references :support, foreign_key: true, dependent: :destroy
      t.timestamps
    end
  end
end
