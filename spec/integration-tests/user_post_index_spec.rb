require 'rails_helper'

RSpec.describe 'User post show view', type: :feature do
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

    # it 'I can see the first comments on a post.' do
    #  page.find('h6', text: 'This comment belongs to the post above.')
    # end
  end
end
