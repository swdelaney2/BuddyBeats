class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :title, uniqueness: { case_sensitive: false }
      t.string :description
      t.boolean :public
      t.integer :quantity
      t.integer :account_id
      t.string :random_hex

      t.timestamps null: false
    end
  end
end
