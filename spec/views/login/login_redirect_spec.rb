require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/sign_in' do
    it 'try to login email password' do
      user = FactoryBot.create(:user)
      user.confirm
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end
  end
end
