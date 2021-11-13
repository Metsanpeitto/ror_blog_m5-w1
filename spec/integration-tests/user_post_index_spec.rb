require 'rails_helper'

RSpec.describe 'User post index view', type: :feature do
  subject { page }
  before do
    login_user
    @current_user = User.last
    @current_user.confirm
    visit "/users/#{@current_user.id}/posts/"
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

    it 'I can see a post title.' do
      page.all('h5', class: 'bio-title')
    end

    it 'I can see some of the post body.' do
      page.all('p', class: 'bio-text')
    end

    it 'I can see the first comments on a post.' do
      expect(page).to have_content('Test rest of the text')
    end

    it 'I can see how many comments a post has.' do
      page.all('h5', class: 'info-number-comments')
    end

    it 'I can see how many likes a post has.' do
      page.all('button', class: 'button-pagination')
    end

    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      page.all('button', class: 'button-pagination')
    end

    it 'When I click on a post, it redirects me to that post show page.' do
      post = @current_user.posts[0]
      click_link(post.id.to_s)
      expect(current_path).to eq user_post_path(@current_user.id, post.id)
    end
  end
end
