require "give_points.rb"
class CommentsController < ApplicationController
  before_filter :find_post, :except => [:add_points, :remove_points]
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    
    @comment = @post.comments.build(params[:comment])
    GivePoints.add_on_create(@comment)
    @comment.user = @user

    if params[:country_name]
      redirect_route = country_post_path(Country.find_by_name(params[:country_name]).name, Post.find(params[:post_id]))
    elsif params[:language_name]
      redirect_route = language_post_path(Language.find_by_name(params[:language_name]).name, Post.find(params[:post_id]))
    end
    respond_to do |format|
      if @comment.save
        format.html { redirect_to redirect_route, :notice => 'Comment was successfully created.' }

      else
        format.html { redirect_to redirect_route, :notice => 'Please write something' }

      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    if params[:country_name]
      redirect_route = country_post_path(Country.find_by_name(params[:country_name]).name, Post.find(params[:post_id]))
    elsif params[:language_name]
      redirect_route = language_post_path(Language.find_by_name(params[:language_name]).name, Post.find(params[:post_id]))
    end
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to redirect_route, :notice => 'Comment was successfully updated.' }
      else
        format.html { redirect_to redirect_route, :notice => 'Please write something' }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :ok }
    end
  end
  
  def add_points
    GivePoints.add(Comment.find(params[:id]), @user)
  end
  
  def remove_points
   GivePoints.remove(Comment.find(params[:id]), @user)
  end
  
  private
  def find_post
    @post = Post.find(params[:post_id])
  end
  def comment_redirect

  end
end
