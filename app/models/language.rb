class Language < ActiveRecord::Base
  has_many :language_in_country
  has_many :countries, :through => :language_in_country
  has_many :speakers
  has_many :users, :through => :speakers
  has_many :posts
  has_many :authors
  has_many :works
   validates_uniqueness_of :name
  validates_presence_of :name
   def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%" )
    else
      scoped
    end
  end
end
