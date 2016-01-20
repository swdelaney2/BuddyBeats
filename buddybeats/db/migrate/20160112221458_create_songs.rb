class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :youtube_id
      t.integer :playlist_id
      t.string :playlist_hex
      t.integer :account_id

      t.timestamps null: false
    end
  end
end
