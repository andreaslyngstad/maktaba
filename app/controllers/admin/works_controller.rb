class Admin::WorksController < Admin::AdminappController
  # GET /works
  # GET /works.json
  def index
    if !params[:search].blank?
    @works = Work.order(:title).search(params[:search]).paginate(:page => params[:page], :per_page => 20 )
    else
    @works = Work.order("created_at DESC").paginate(:page => params[:page], :per_page => 20 )
    end
    @languages = Language.all
      respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @works }
    end
  end

  # GET /works/1
  # GET /works/1.json
  def show
    @work = Work.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @work }
    end
  end

  # GET /works/new
  # GET /works/new.json
  def new
    @work = Work.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @work }
    end
  end

  # GET /works/1/edit
  def edit
    @work = Work.find(params[:id])
  end

  # POST /works
  # POST /works.json
  def create
    @work = Work.new(params[:work])

    respond_to do |format|
      if @work.save
        format.html { redirect_to admin_work_path(@work), :notice => 'Work was successfully created.' }
        format.json { render :json => admin_work_path(@work), :status => :created, :location => @work }
      else
        format.html { render :action => "new" }
        format.json { render :json => @work.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /works/1
  # PUT /works/1.json
  def update
    @work = Work.find(params[:id])

    respond_to do |format|
      if @work.update_attributes(params[:work])
        format.html { redirect_to admin_work_path(@work), :notice => 'Work was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @work.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work = Work.find(params[:id])
    @work.destroy

    respond_to do |format|
      format.html { redirect_to admin_works_url }
      format.json { head :ok }
    end
  end
end
