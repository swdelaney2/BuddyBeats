class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :youtube_id
      t.string :spotify_id
      t.string :spotify_img
      t.integer :playlist_id
      t.string :playlist_hex
      t.integer :account_id

      t.timestamps null: false
    end
  end
end
