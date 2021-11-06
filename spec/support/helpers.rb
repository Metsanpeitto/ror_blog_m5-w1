RSpec.shared_context 'When authenticated' do
  background do
    authenticate
  end

  def authenticate
    visit new_user_session_path
    within('#new_user') do
      fill_in 'user_email', with: 'abraham@waldenberginc.com'
      fill_in 'user_password', with: '123456'
    end
    click_button 'Log in'
  end
end
