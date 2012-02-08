require "give_points.rb"
class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:new, :edit, :create, :update]
  layout "sign_up"
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    find_languages_and_countries
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    find_languages_and_countries
    @user = User.find(params[:id])
   
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    find_languages_and_countries
    @user.is_admin = false
    GivePoints.add_on_create(@user)
    respond_to do |format|
      if @user.save
        format.html { redirect_to confirmation_has_been_sent_path, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
        else
        format.html { render :controller => "public", :action => "public_signin" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    params[:user][:language_ids] ||= []
    @user = User.find(params[:id])
   find_languages_and_countries
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        sign_in(@user, :bypass => true)
        format.html { redirect_to public_user_path, :notice => 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
  private
  def find_languages_and_countries
    @countries = Country.order(:name)
    @languages_common = Language.where(:common => true).order(:name)
    @languages_not_common = Language.where(:common => false).order(:name)
    @user_languages = @user.languages.all
  end
end
