class Author < ActiveRecord::Base
  has_one :user
  has_many :works
  belongs_to :language
  belongs_to :country
  attr_accessible :name, :bio, :birth_death, :death, :language_id, :user_id, :language_name, :country_id, :portrait
  validates_presence_of :name, :country_id
  validates_uniqueness_of :name
  has_attached_file :portrait, :styles => { :original => "250x250#", :thumb => "50x50#" },
      :storage => :s3,
                      :bucket => 'the_maktaba_website',
                        :s3_credentials => Rails.root.join('config/amazon_s3.yml'),
                        :path => "author/:filename"
  
  def language_name
    language.try(:name)
  end

  def language_name=(name)
    self.language = Language.find_by_name(name) if name.present?
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  def age
   Time.now.year - birth.year
  end
end
