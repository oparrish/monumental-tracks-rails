class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :post_id
      t.integer :number
      t.string :artist
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
