require 'rails_helper'

RSpec.describe 'Login view', type: :request do
  describe 'sign_in page' do
    it 'shows the email label' do
      visit new_user_session_path
      expect(page).to have_field('Email')
    end
    it 'shows the password label' do
      visit new_user_session_path
      expect(page).to have_field('Password')
    end
    it 'shows the button with label "Submit"' do
      visit new_user_session_path
      expect(page).to have_button('Log in')
    end
  end
end
