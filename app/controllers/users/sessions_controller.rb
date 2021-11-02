class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  ## GET /resource/sign_in
  # def new
  #  super
  # end

  ## POST /resource/sign_in
  # def create
  #  super
  # end

  ## DELETE /resource/sign_out
  # def destroy
  #  super
  # end

  ## protected

  ## If you have extra params to permit, append them to the sanitizer.
  ## def configure_sign_in_params
  ##   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  ## end

  # def create
  #  # user = User.find_by_email(params[:email].downcase)
  #  byebug

  #  if user && user.authenticate(params[:password])
  #    if user.email_confirmed
  #      # sign_in user
  #      # redirect_back_or user
  #    else
  #      flash.now[:error] = 'Please activate your account by following the
  #      instructions in the account confirmation email you received to proceed'
  #      render 'new'
  #    end
  #  else
  #    flash.now[:error] = 'Invalid email/password combination' # Not quite right!
  #    render 'new'
  #  end
  # end
end
