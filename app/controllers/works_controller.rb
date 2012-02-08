class WorksController < ApplicationController
   skip_before_filter :authenticate_user!, :user, :only => [:show]
  # GET /works
  # GET /works.json
  def index
    @works = Work.order(:title).where("title like ?", "%#{params[:term]}%")
    autoload_helper(@works, :title)
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
    @work.user = @user
    @work.country = @work.author.country  if @work.author
    respond_to do |format|
      if @work.save
        flash[:notice] = flash_helper('Work was successfully created.')
        format.html { redirect_to country_work_path(@work.country.name,@work), :notice => 'Work was successfully created.' }
        format.json { render :json => @work, :status => :created, :location => @work }
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
    @work.country = @work.author.country

    respond_to do |format|
      if @work.update_attributes(params[:work])
        format.html { redirect_to country_work_path(@work.country.name,@work), :notice => 'Work was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @work.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json

end
