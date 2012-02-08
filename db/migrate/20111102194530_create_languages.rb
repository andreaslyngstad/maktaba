class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      
      t.string :name
      t.text :history
      t.text :examples
      t.boolean :common
      t.timestamps
    end
  end
end
