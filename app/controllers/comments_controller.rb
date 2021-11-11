class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_comment, only: %i[show edit update destroy]

  rescue_from CanCan::AccessDenied do
    redirect_to root_path
  end

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
    @comment = Comment.new(user_id: current_user.id, post_id: @post.id, text: params[:comment][:text])
    respond_to do |format|
      if @comment.save
        format.html do
          flash[:notice] = 'You have successfully create a comment.'
          redirect_back fallback_location: root_path, notice: 'Comment was successfully created.'
        end
        format.json { render :show, status: :created, location: @comment }
      else
        flash[:alert] = "The comment couldn't be created."
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # def create
  #  @post = Post.find(params[:post_id])
  #  @comment = @post.comments.build(params[:comment])
  #  @comment.user = current_user
  #  @comment.save
  #  redirect_to post_path(@post)
  # end

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
      format.html do
        flash[:notice] = 'Comment was successfully destroyed.'
        redirect_back fallback_location: root_path, notice: 'Comment was successfully destroyed.'
      end
      format.json { render :show, status: :created, location: @comment }
    end
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
    @post = @comment.post_id
  end

  def comment_params
    params.fetch(:comment, {})
    params.require(:comment).permit(:text, :body)
  end
end
