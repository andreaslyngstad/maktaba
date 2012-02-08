class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :population
      t.text :description
      t.text :history
      t.text :path
      t.text :color
      t.timestamps
    end
  end
end
