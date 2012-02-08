class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.text :instructions
      t.text :first_page
      t.text :footer
    end
  end
end
