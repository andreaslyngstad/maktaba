class Country < ActiveRecord::Base
  has_many :language_in_country 
  has_many :languages, :through => :language_in_country
  has_many :users
  has_many :authors
  has_many :posts
  has_many :works
  validates_uniqueness_of :name
  validates_presence_of :name
end
