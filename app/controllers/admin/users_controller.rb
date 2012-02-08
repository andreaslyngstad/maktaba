class Admin::UsersController < Admin::AdminappController
  # GET /users
  # GET /users.json
  def new
    @user = User.new
     @countries = Country.all
    @languages = Language.all
  end
  def index
      if !params[:search].blank?
    @users = User.order("points ASC").search(params[:search]).paginate(:page => params[:page], :per_page => 20 )
    else
    @users = User.order("points ASC").paginate(:page => params[:page], :per_page => 20 )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end
   def edit

    @user = User.find(params[:id])

  end
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @comments = @user.comments.order("points ASC").paginate(:page => params[:page], :per_page => 10 )
    @posts = @user.posts.order("points ASC").paginate(:page => params[:page], :per_page => 10 )
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end
   def create
    @user = User.new(params[:user])
    @countries = Country.all
    @languages = Language.all

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_user_path(@user), :notice => 'user was successfully created.' }
        format.json { render :json => admin_user_path(@user), :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
    def update

    @user = User.find(params[:id])


    respond_to do |format|
      if @user.update_attributes(params[:user])

        format.html { redirect_to admin_user_path(@user), :notice => 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :ok }
    end
  end
end
