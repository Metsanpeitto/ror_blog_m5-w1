class PostsController < ApplicationController
  load_and_authorize_resource
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

  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.where(user_id: params[:user_id])
    @posts = Post.update_all(@posts)
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @post = @user.posts.find_by(id: params[:id])
    @post = Post.update_counter(@post)
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
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
    @post = Post.find_by(id: params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to "/users/#{current_user.id}/posts", notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = !Post.find(params[:id]).nil?
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.fetch(:post, {})
    params.require(:post).permit(:title, :text)
  end
end
