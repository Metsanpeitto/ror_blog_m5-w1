require 'rails_helper'

RSpec.describe 'User show view', type: :feature do
  subject { page }
  before do
    login_user
    @current_user = User.last
    @current_user.confirm
    visit "/users/#{@current_user.id}"
  end

  describe 'with user signed in' do
    it 'I can see the user profile picture.' do
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
      expect(page).to have_css('div.bio', minimum: 3)
    end

    it 'I can see a button that lets me view all of a user posts.' do
      expect(page).to have_link('All posts')
    end

    it 'When I click a user post, it redirects me to that post show page.' do
      posts = @current_user.obtain_last_posts(@current_user.id)
      click_link(posts[0].id.to_s)
      expect(current_path).to eq "/users/#{@current_user.id}/posts/#{posts[0].id}"
    end

    it 'When I click to see all posts, it redirects me to the user post index page.' do
      click_link('All posts')
      expect(current_path).to eq "/users/#{@current_user.id}/posts"
    end
  end
end
