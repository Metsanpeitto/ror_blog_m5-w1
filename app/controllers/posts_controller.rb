class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

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

  # GET /posts or /posts.json
  def index
    @posts = Post.all
    @user = User.find_by(id: params[:user_id])
    @user_posts = Post.where(user_id: params[:user_id])
    @post_data = prepare_post_comment
  end

  # GET /posts/1 or /posts/1.json
  def show
    @user = User.find_by(id: params[:user_id])
    @user_posts = []
    @user_posts << Post.find_by(id: params[:id])
    data = prepare_post_comment
    @post_data = data[0]
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    id = params[:user_id]
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

  # PATCH/PUT /posts/1 or /posts/1.json
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

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
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
