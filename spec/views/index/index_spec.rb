require 'rails_helper'

RSpec.describe 'Index view', type: :feature do
  subject { page }
  before do
    login_user
    @other_user = FactoryBot.create :user, name: 'the_other', email: 'test@mail.com'
    visit root_path
  end

  describe 'after signin' do
    it 'I can see the username of all other users' do
      expect(page).to have_content @other_user.name
    end

    it 'I can see the profile picture for each user.' do
      expect(page).to have_selector('img')
    end

    it 'I can see the number of posts each user has written.' do
      page.all('h5', text: 'Number of posts')
    end
    
    it 'When I click on a user, I am redirected to that user show page.
' do
      find_link(@other_user.id.to_s).click
      expect(current_path).to eq user_posts_path(@other_user.id)
    end
  end
end
