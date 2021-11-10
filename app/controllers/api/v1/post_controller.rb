class Api::V1::PostController < ApiController
  before_action :authenticate_user!
  def index
    puts current_user.email
    render json: { user: current_user.email, list: [1, 2, 3] }
  end
end
