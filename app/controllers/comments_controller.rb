class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :set_user
  before_action :set_post

  def index
    @comments = Comment.all
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def edit; end

  def create
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new(user_id: @user.id, post_id: @post.id, text: params[:comment][:body])
    respond_to do |format|
      if @comment.save
        format.html do
          flash[:notice] = 'You have successfully create a comment.'
          redirect_to user_post_path(id: @post.id, user_id: @user.id), notice: 'Comment was successfully created.'
        end
        format.json { render :show, status: :created, location: @comment }
      else
        flash[:alert] = "The comment couldn't be created."
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end

  def set_user
    post = Post.find_by(id: params[:post_id])
    @user = User.find_by(id: post[:user_id])
    @user
  end

  def comment_params
    params.fetch(:comment, {})
    params.require(:comment).permit(:text, :body)
  end
end
