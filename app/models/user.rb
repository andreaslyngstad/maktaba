class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :name,
                  :bio,
                  :birth,
                  :location,
                  :role,
                  :language_ids,
                  :country_id,
                  :image,
                  :given_points,
                  :points,
                  :is_admin
  has_many :speakers
  has_many :languages, :through => :speakers
  has_many :posts
  has_many :comments
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :given_points, :class_name => "GivenPoint", :foreign_key => "giver_id"
  has_many :gotten_points, :class_name => "GivenPoint", :foreign_key => "user_id"
  belongs_to :author
  belongs_to :country
  validates_presence_of :password, :on => :create
  validates_presence_of :name, :country_id
  has_attached_file :image, :styles => { :medium => "150x150>", :thumb => "50x50#" },
      :storage => :s3,
                      :bucket => 'the_maktaba_website',
                        :s3_credentials => Rails.root.join('config/amazon_s3.yml'),
                        :path => "user/:filename"
  
  def login
    authenticate(password)
  end
  def self.search_friends(search)
    where('name LIKE ?', "%#{search}%")
  end

  def age
   Time.now.year - birth.year if birth
  end
   def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
