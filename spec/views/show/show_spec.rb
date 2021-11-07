require 'rails_helper'

RSpec.describe 'Show view', type: :feature do
  subject { page }
  before do
    login_user
    @current_user = User.last
    @current_user.confirm
    visit "/users/#{@current_user.id}"
  end

  describe 'with user signed in' do
    it 'I can see the profile picture of the user.' do
      expect(page).to have_selector('img')
    end

    it 'I can see the username ' do
      expect(page).to have_content @current_user.name
    end

    it 'I can see the number of posts the user has written.' do
      page.all('h5', text: 'Number of posts')
    end

    it 'I can see the user bio.' do
      expect(page).to have_content 'Bio'
    end

    it 'I can see the user first 3 posts.' do
      find('div.bio', count: 3)
    end

    it 'I can see a button that lets me view all of a user posts.' do
      expect(page).to have_selector('button')
    end

    # it 'When I click a user post, it redirects me to that post show page.' do

    #  expect(current_path).to eq user_post_path(user_id: @current_user.id, id: '1')
    # end
  end

  describe 'after registration signout and login' do
    it 'I can see the number of posts each user has written.' do
      page.find('#1', visible:all).click
      expect(current_path).to eq user_post_path(user_id: @current_user.id, id: '1')
    end
  end
end
