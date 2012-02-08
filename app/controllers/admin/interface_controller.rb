class Admin::InterfaceController < Admin::AdminappController
  
  def index
     @users = User.order("points ASC").limit(20)
     @posts = Post.order("points ASC").limit(20)
     @comments = Comment.order("points ASC").limit(20)
  end
end