class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.integer :user_id
      t.integer :language_id
      t.timestamps
    end
  end
end
