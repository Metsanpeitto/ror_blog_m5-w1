class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  load_and_authorize_resource

  def like_hit
    post_id = params[:data][:post_id]
    user_id = params[:data][:user_id]
    Like.increment(user_id, post_id)
    Like.update_counter(post_id)
    redirect_back fallback_location: { action: 'show' }
  end

  def all_posts(id)
    User.all_posts(id)
  end

  def index
    @posts = Post.all
    @user = User.find_by(id: params[:user_id])
    @user_posts = Post.where(user_id: params[:user_id])
    @post_data = prepare_post_comment
    current_user
  end

  def show
    user_id = current_user[:id]
    post_id = params[:id]
    @user = User.find_by(id: user_id)
    @user_posts = []
    @user_posts << Post.find_by(id: post_id)
    data = prepare_post_comment
    @post_data = data.pop
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    id = current_user[:id]
    title = post_params[:title]
    text = post_params[:text]
    @post = Post.new(user_id: id, title: title, text: text)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
        flash[:notice] = 'You have successfully created post.'

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        flash[:alert] = "The post coulnd't be created."

      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to "/users/#{current_user.id}/posts", notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = !Post.find(params[:id]).nil?
  end

  def post_params
    params.fetch(:post, {})
    params.require(:post).permit(:title, :text)
  end

  def prepare_post_comment
    post_data = []
    @user_posts.each do |post|
      new_post = Post.likes_comments(post)
      data = [new_post, Post.all_comments(new_post.id)]
      post_data << data
    end
    post_data
  end
end
