class AuthorsController < ApplicationController
   skip_before_filter :authenticate_user!, :user, :only => [:index,:show]
  before_filter :countries
  # GET /authors
  # GET /authors.json
  def index
    @authors = Author.order(:name).where("name like ?", "%#{params[:term]}%")
    autoload_helper(@authors, :name)
  end

  # GET /authors/1
  # GET /authors/1.json
  def show
    @author = Author.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @author }
    end
  end

  # GET /authors/new
  # GET /authors/new.json
  def new
    @user = current_user
    @author = Author.new
    @countries = Country.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @author }
    end
  end

  # GET /authors/1/edit
  def edit
    @author = Author.find(params[:id])
  end

  # POST /authors
  # POST /authors.json
  def create
    @author = Author.new(params[:author])
    @author.user = @user
    @country = Country.find(params[:author][:country_id])
    respond_to do |format|
      if @author.save
        format.html { redirect_to country_author_path(@country.name,@author), :notice => 'Author was successfully created.' }
        format.json { render :json => @author, :status => :created, :location => @author }
      else
        format.html { render :action => "new" }
        format.json { render :json => @author.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /authors/1
  # PUT /authors/1.json
  def update
    @author = Author.find(params[:id])
    @country = Country.find(params[:author][:country_id])
    respond_to do |format|
      if @author.update_attributes(params[:author])
        format.html { redirect_to country_author_path(@country.name,@author), :notice => 'Author was successfully updated.' }
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
      format.html { redirect_to authors_url }
      format.json { head :ok }
    end
  end
end
