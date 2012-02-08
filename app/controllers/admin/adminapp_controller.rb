class Admin::AdminappController < ApplicationController
  layout "application"
before_filter :require_admin!

protected
def require_admin!
  unless current_user.try :is_admin?
    redirect_to root_path, :alert => "Access Denied"
  end
end
end
