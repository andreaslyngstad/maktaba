class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :post_id
      t.integer :user_id
       t.integer :points
      t.timestamps
    end
  end
end
