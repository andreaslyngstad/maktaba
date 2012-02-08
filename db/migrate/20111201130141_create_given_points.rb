class CreateGivenPoints < ActiveRecord::Migration
  def change
    create_table :given_points do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :comment_id
      t.integer :giver_id
      t.boolean :up
      t.timestamps
    end
  end
end
