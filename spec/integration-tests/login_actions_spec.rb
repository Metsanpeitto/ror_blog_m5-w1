require 'rails_helper'

RSpec.describe 'Login view', type: :request do
  describe 'Login view ' do
    it "When I click the submit button without filling in the email
  and the password, I get a detailed error." do
      visit '/users/sign_in'

      find('#user_email').set('')
      find('#user_password').set('')

      click_button 'Log in'

      expect(page).to have_text('Invalid Email or password.')
    end

    it "When I click the submit button after filling in the username and the
     password with incorrect data, I get a detailed error." do
      visit new_user_session_path

      find('#user_email').set('abraham@waldenberginc.com')
      find('#user_password').set('')

      click_button 'Log in'

      expect(page).to have_text('Invalid Email or password.')
    end
  end

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
