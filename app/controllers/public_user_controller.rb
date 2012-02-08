class PublicUserController < ApplicationController
  layout "public"
  def index
    @user = current_user
    @posts = @user.posts.order("created_at DESC").paginate(:page => params[:page], :per_page => 10 )
     @country = @user.country
    @new_works = @country.works.order(:created_at).limit(5)
    @language_countries = @country.languages
  end

  def edit
    @user = current_user
    @countries = Country.order(:name)
    @languages_common = Language.where(:common => true).order(:name)
    @languages_not_common = Language.where(:common => false).order(:name)
  end
  

end
