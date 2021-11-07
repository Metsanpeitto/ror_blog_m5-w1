module ControllerMacros
  def login_user
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = FactoryBot.create(:user)
    sign_in user
  end
  # def login_user
  #  before(:each) do
  #    @request.env['devise.mapping'] = Devise.mappings[:user]
  #    user = FactoryBot.create(:user)
  #    user.confirm
  #    visit new_user_session_path
  #    fill_in 'Email', with: user.email
  #    fill_in 'Password', with: user.password
  #    click_button 'Log in'
  #  end
  # end
end
