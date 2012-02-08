class Admin::AuthorsController < Admin::AdminappController
  # GET /authors
  # GET /authors.json
  def index

     if !params[:search].blank?
    @authors = Author.order(:name).search(params[:search]).paginate(:page => params[:page], :per_page => 20 )
    else
    @authors = Author.order(:name).paginate(:page => params[:page], :per_page => 20 )
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @authors }
    end
  end

  # GET /authors/1
  # GET /authors/1.json
  def new
     @author = Author.new
      @countries = Country.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @author }
    end
  end
  def show
    @author = Author.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @author }
    end
  end



  # GET /authors/1/edit
  def edit
    @author = Author.find(params[:id])
    @countries = Country.all
  end
  def create
    @author = Author.new(params[:author])
    @countries = Country.all

    respond_to do |format|
      if @author.save
        format.html { redirect_to admin_author_path(@author), :notice => 'Country was successfully created.' }
        format.json { render :json => admin_author_path(@author), :status => :created, :location => @author }
      else
        format.html { render :action => "new" }
        format.json { render :json => @author.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @author = Author.find(params[:id])

    respond_to do |format|
      if @author.update_attributes(params[:author])
        format.html { redirect_to admin_author_path(@author), :notice => 'Author was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @author.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    respond_to do |format|
      format.html { redirect_to admin_authors_url }
      format.json { head :ok }
    end
  end
end
