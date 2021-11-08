require 'rails_helper'

RSpec.describe 'User post show view', type: :feature do
  subject { page }
  before do
    login_user
    @current_user = User.last
    @current_user.confirm
    @post = FactoryBot.create :post_with_comments, comments_counter: 3, user: @current_user
    visit "/users/#{@current_user.id}/posts/#{@post.id}"
  end

  describe 'with user signed in' do
    it 'I can see a post title.' do
      page.all('h5', class: 'bio-title')
    end

    it 'I can see who wrote the post. ' do
      expect(page).to have_content @current_user.name
    end

    it 'I can see the number of comments it has.' do
      page.all('h5', class: 'bio-likes')
    end

    it 'I can see the number of likes it has.' do
      page.all('h5', class: 'bio-likes')
    end

    it 'I can see some of the post body.' do
      page.all('p', class: 'bio-text')
    end

    it 'I can see the username of each commentor.' do
      page.all('h6', class: 'post_comment-text')
    end

    it 'I can see the comment each commentor left.' do
      page.all('h6', class: 'post_comment-text')
    end
  end
end
