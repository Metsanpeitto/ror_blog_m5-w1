require 'rails_helper'

RSpec.describe 'Index view', type: :feature do
  login_user

  background do
    @other_user = FactoryBot.create :user, name: 'Other user'
    visit root_path
  end
  describe 'after signin' do
    it 'I can see the username of all other users' do
      expect(page).to have_content @other_user.name
    end
  end
end
