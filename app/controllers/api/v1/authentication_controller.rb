class Api::V1::AuthenticationController < ApiController
  skip_before_action :authenticate_user!, only: [:create]
  def create
    user = User.find_by(email: params[:email])
    puts user
    if user&.valid_password?(params[:password])
      render json: { token: JsonWebToken.encode(sub: user.id) }
    else
      render json: { errors: 'invalid' }
    end
  end

  def fetch
    render json: current_user
  end
end
