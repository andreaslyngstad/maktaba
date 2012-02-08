class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :points
      t.string  :name
      t.integer :country_id
      t.text  :bio
      t.date    :birth
      t.string  :location

      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
  end
end
