class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :comments_count, :limit => 4, :default => 0, :null => false
      t.integer :language_id
      t.integer :country_id
      t.integer :user_id
      t.integer :points
      
      t.timestamps
    end
  end
end
