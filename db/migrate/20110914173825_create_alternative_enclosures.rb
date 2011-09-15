class CreateAlternativeEnclosures < ActiveRecord::Migration
  def change
    create_table :alternative_enclosures do |t|
      t.integer :enclosure_id
      t.string :alternative_file_name
      t.string :alternative_content_type
      t.integer :alternative_file_size
      t.datetime :alternative_updated_at

      t.timestamps
    end
  end
end
