class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.text :summary
      t.integer :language_id
      t.integer :author_id
      t.integer :original_id      
      t.integer :country_id      
      t.string :number
      t.string :published
      t.string :cover_file_name
      t.string :cover_content_type
      t.integer :cover_file_size
      t.datetime :cover_updated_at
      t.timestamps
    end
  end
end