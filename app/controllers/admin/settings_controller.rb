class Admin::SettingsController < Admin::AdminappController
  # GET /admin/settings
  # GET /admin/settings.json
  def index
    @setting = Setting.first

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_settings }
    end
  end



  def edit
  @setting = Setting.find(1)
  end


  def update
    @setting = Setting.find(params[:id])

    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        format.html { redirect_to admin_settings_path, notice: 'Setting was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end


end
