require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { FactoryBot.create(:user_with_posts) }

  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET #index' do
    before(:example) { get :index }
    it 'to posts#index returns a 302 custom status code' do
      expect(response).to have_http_status('200')
    end

    it 'to posts#index the correct template is rendered' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before(:example) do
      @posts = user.posts.all
      visit "/users/#{user.id}/posts/#{@posts[0].id}/"
    end

    it 'to posts#show returns a 200 custom status code' do
      expect(response).to have_http_status('200')
    end

    it 'to posts#show the correct template is rendered' do
      expect(response).to render_template(:show)
    end
  end
end
