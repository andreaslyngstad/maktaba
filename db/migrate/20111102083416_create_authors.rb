class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :language_id
      t.integer :country_id
      t.integer :user_id
      t.text :bio
      t.string :birth_death
      t.string :portrait_file_name
      t.string :portrait_content_type
      t.integer :portrait_file_size
      t.datetime :portrait_updated_at
      t.timestamps
    end
  end
end
