class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :youtube_id
      t.string :playlist_id
      t.integer :account_id

      t.timestamps null: false
    end
  end
end
