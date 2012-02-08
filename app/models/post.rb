class Post < ActiveRecord::Base
  belongs_to :country
  belongs_to :user
  has_many :given_points
  belongs_to :language
  has_many :comments, :order => "created_at ASC",
                      :dependent => :destroy
  validates_presence_of :title, :text, :language_id, :user_id
  
 
  

  
  def language_name
    language.try(:name)
  end

  def language_name=(name)
    self.language = Language.find_by_name(name) if name.present?
  end
  def self.search(search)
    if search
      where('title LIKE ? OR text LIKE ?', "%#{search}%", "%#{search}%" )
    else
      scoped
    end
  end
  def self.user_search(search)
    if search
      User.where('name LIKE ? ', "%#{search}%" ).first.posts

    else
      scoped
    end
  end
end
#Post.recent_comments(User.first)