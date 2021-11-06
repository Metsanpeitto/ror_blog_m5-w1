RSpec.describe 'Login view', type: :system do
  describe 'Login view ' do
    it "When I click the submit button without filling in the email
  and the password, I get a detailed error." do
      visit new_user_session_path

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

    # it "When I click the submit button after filling in the username and the
    # password with correct data, I am redirected to the root page." do
    #  visit new_user_session_path

    #  find('#user_email').set('abraham@waldenberginc.com')
    #  find('#user_password').set('123456')

    #  click_button 'Log in'

    #  # expect(page).to render('/')
    #  expect(response).to have_text('Signed in as abraham@waldenberginc.com. This cannot be cheese?')
    #  expect(response).to have_current_path('/', wait: 10)
    # end
  end
end
