class CreateLanguageInCountries < ActiveRecord::Migration
  def change
    create_table :language_in_countries do |t|
      t.string :speakers_in_country
      t.text :comment
      t.integer :country_id
      t.integer :language_id

      t.timestamps
    end
  end
end
