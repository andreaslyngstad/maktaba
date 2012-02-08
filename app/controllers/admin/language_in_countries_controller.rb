class Admin::LanguageInCountriesController < Admin::AdminappController
  # GET /languages
  # GET /languages.json
  def index
    @language_in_country = LanguageInCountry.order(:country_id).paginate(:page => params[:page], :per_page => 20 ).includes([:country, :language])


    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @languages }
    end
  end

  # GET /languages/1
  # GET /languages/1.json
  def show
    @language_in_country = LanguageInCountry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @language }
    end
  end

  # GET /languages/new
  # GET /languages/new.json
  def new
    @language_in_country = LanguageInCountry.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @language }
    end
  end

  # GET /languages/1/edit
  def edit
    @language_in_country = LanguageInCountry.find(params[:id])

  end

  # POST /languages
  # POST /languages.json
  def create
    @language_in_country = LanguageInCountry.new(params[:language_in_country])

    respond_to do |format|
      if @language_in_country.save
        format.html { redirect_to admin_language_in_country_path(@language_in_country), :notice => 'Language was successfully created.' }

      else
        format.html { render :action => "index" }
        format.json { render :json => @language_in_country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /languages/1
  # PUT /languages/1.json
  def update
    @language_in_country = LanguageInCountry.find(params[:id])

    respond_to do |format|
      if @language_in_country.update_attributes(params[:language_in_country])
        format.html { redirect_to admin_language_in_country_path(@language_in_country), :notice => 'Language was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @language_in_country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.json
  def destroy
    @language_in_country = LanguageInCountry.find(params[:id])
    @language_in_country.destroy

    respond_to do |format|
      format.html { redirect_to admin_language_in_countries_url }
      format.json { head :ok }
    end
  end
end
