class Api::V1::PostController < ApiController
  # before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:create]

  def index
    render json: Post.all
  rescue ActiveRecord::RecordNotFound
    render json: {}, status: :not_found
  end

  def comments
    render json: Comment.where(post_id: params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {}, status: :not_found
  end

  def new_comment
    @comment = Comment.new(user_id: current_user.id, post_id: params[:post_id], text: params[:text])
    if @comment.save
      render json: { status: 'created', comment: @comment }
    else
      render json: { errors: 'invalid' }
    end
  end
end
