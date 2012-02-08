class Comment < ActiveRecord::Base
  belongs_to :post, :counter_cache => true
  belongs_to :user
  has_many :given_points
  scope :recent_comments_grouped_by_post, order("updated_at DESC").group(:post_id).limit(5)
  validates_presence_of :text, :message => "Please write something"
end
