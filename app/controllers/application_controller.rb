class ApplicationController < ActionController::Base
   uses_markdown_preview
  protect_from_forgery
  before_filter :authenticate_user!, :user, :countries

  layout "public"
  def autoload_helper(object, property)
    if object.empty?
       render json: ["Nothing matches this in the database"]
    else
      render json: object.map(&property)
    end
  end
  def stored_location_for(resource)
    if current_user && params[:redirect_to]
      flash[:notice] = "Congratulations, you're signed up!"
      return params[:redirect_to]
    end
    super( resource ) 
  end
  private
  def user
    @user = current_user
  end
  def countries
    @countries = Country.all
  end
  def after_sign_in_path_for(resource)
    public_user_path
  end
  
  def flash_helper(message)
    return ("<span style='color:#FFF'>" + message + "</span>").html_safe
  end 
end
