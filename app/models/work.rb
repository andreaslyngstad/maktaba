class Work < ActiveRecord::Base
  belongs_to :author
  belongs_to :language
  belongs_to :user
  belongs_to :country
  has_many :translations, :class_name => "Work"
  belongs_to :original, :class_name => "Work", :foreign_key => "original_id"
  has_many :comments
  validates_presence_of :title, :language_id, :summary, :author_id
  attr_accessible :title, :published, :language_id, :language_name, :country_id, :user_id, :cover, :number, :original_id, :original_title, :author_id, :author_name, :summary
  has_attached_file :cover, :styles => { :original => "160x250#", :thumb => "40x60#" },
      :storage => :s3,
                      :bucket => 'the_maktaba_website',
                        :s3_credentials => Rails.root.join('config/amazon_s3.yml'),
                        :path => "work/:filename"

  def language_name
    language.try(:name)
  end
  def language_name=(name)
    self.language = Language.find_by_name(name) if name.present?
  end

  def author_name
    author.try(:name)
  end
  def author_name=(name)
    self.author = Author.find_by_name(name) if name.present?
  end

  def original_title
    original.try(:title)
  end
  def original_title=(title)
    self.original= Work.find_by_title(title) if title.present?
  end
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%" )
    else
      scoped
    end
  end
end
