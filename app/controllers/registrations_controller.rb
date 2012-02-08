class RegistrationsController < Devise::RegistrationsController
  layout "sign_up"
      skip_before_filter :authenticate_user!, :only => [:new,:create]

 def create
    build_resource
    find_languages_and_countries
    resource.points = 0
    resource.is_admin = false
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      respond_with_navigational(resource) { render_with_scope :new }
    end
  end
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
  find_languages_and_countries
    if resource.update_with_password(params[resource_name])
      if is_navigational_format?
        if resource.respond_to?(:pending_reconfirmation?) && resource.pending_reconfirmation?
          flash_key = :update_needs_confirmation
        end
        set_flash_message :notice, flash_key || :updated
      end
      sign_in resource_name, resource, :bypass => true
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      respond_with_navigational(resource){ render_with_scope :edit }
    end
  end
   def find_languages_and_countries
    @countries = Country.order(:name)
    @languages_common = Language.where(:common => true).order(:name)
    @languages_not_common = Language.where(:common => false).order(:name)
    @user_languages = @user.languages.all
  end
end