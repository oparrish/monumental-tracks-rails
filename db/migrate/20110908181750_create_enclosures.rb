class CreateEnclosures < ActiveRecord::Migration
  def change
    create_table :enclosures do |t|
      t.integer :post_id
      t.string :enclosure_file_name
      t.string :enclosure_content_type
      t.integer :enclosure_file_size
      t.datetime :enclosure_updated_at

      t.timestamps
    end
  end
end
