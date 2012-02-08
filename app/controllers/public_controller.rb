class PublicController < ApplicationController

  layout "public", :exept => [:index]
  skip_before_filter :authenticate_user!
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  before_filter :allow_params_authentication!, :only => :create
  include Devise::Controllers::InternalHelpers
  def index
    resource = build_resource
    clean_up_passwords(resource)
    @countries = Country.all
    @country = Country.find_by_name("South Africa")
    respond_to do |format|
      format.html {render :layout => "first"}
      
    end
  end

  def country
    news_country
  end
   def country_works
    news_country
    @works = Work.search(params[:search]).where(:country_id => @country.id).paginate(:page => params[:page], :per_page => 10 )
   end
  def country_work
    news_country
    @work = @country.works.find(params[:id])

   end
  def country_authors
    news_country
    @authors = Author.search(params[:search]).where(:country_id => @country.id ).paginate(:page => params[:page], :per_page => 10 )

  end
   def country_author
    news_country
    @author = @country.authors.find(params[:id])
  end
   def country_posts
    news_country
    @posts = Post.order("created_at DESC").includes([:given_points, :country, :user]).search(params[:search]).where(:country_id => @country.id).paginate(:page => params[:page], :per_page => 10 )

  end
def country_post
   news_country
     @post = @country.posts.find(params[:id])

  end

  def language
    news_language
    @language_in_country = LanguageInCountry.order(:country_id)
  end
  def language_works
    news_language
    @works = Work.search(params[:search]).where(:language_id => @language.id).paginate(:page => params[:page], :per_page => 10 )

  end
  def language_work
    news_language
    @work = @language.works.find(params[:id])
  end
   def language_posts
    news_language
    @posts =  Post.order("created_at DESC").search(params[:search]).where(:language_id => @language.id).paginate(:page => params[:page], :per_page => 10 )
  end
   def language_post
    news_language
    @post = @language.posts.find(params[:id])
    end
  def language_authors
   news_language
    @authors = Author.search(params[:search]).where(:language_id => @language.id).paginate(:page => params[:page], :per_page => 10 )
  end
  def language_author
      news_language
      @author = @language.authors.find(params[:id])
    end

  def public_signin
    @user = User.new
    @countries = Country.order(:name)
    @languages_common = Language.where(:common => true).order(:name)
    @languages_not_common = Language.where(:common => false).order(:name)
     respond_to do |format|
      format.html {render :layout => "sign_up"}

    end
  end
  
  def confirmation_has_been_sent
    
  end
  def create_user
    @user = User.new(params[:user])
    @countries = Country.order(:name)
    @languages_common = Language.where(:common => true).order(:name)
    @languages_not_common = Language.where(:common => nil && false).order(:name)
    @user.role = "user"
    respond_to do |format|
      if @user.save
        format.html { redirect_to public_user_path, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "public_signin" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  def languages_in_country
    @country = Country.find(params[:id])
    @languages = @country.languages
  end
  private
  def news_language
    @language = Language.find_by_name(params[:name])
    @new_works = @language.works.order(:created_at).limit(5)
    @language_countries = @language.countries
    @language_in_countries = LanguageInCountry.where(:language_id => @language.id)
    end
  def news_country
    @country = Country.find_by_name(params[:name])
    @new_works = @country.works.order(:created_at).limit(5)
    @language_countries = @country.languages

  end
  def instructions
    @settings = Setting.first
  end
end
