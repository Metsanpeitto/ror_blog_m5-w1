require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user_with_posts) }

  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET #index' do
    before(:example) do
      get :index, format: 'html'
    end

    it 'to users#index returns a 200 custom status code' do
      expect(response).to have_http_status('200')
    end

    it 'to users#index the correct template is rendered' do
      expect(response).to render_template(:index)
    end

    it 'to users#index the response body includes the right placeholder' do
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET #show' do
    before(:example) do
      visit "/users/#{user.id}"
    end

    it 'to users#show returns a 200 custom status code' do
      expect(response).to have_http_status('200')
    end

    it 'to users#show the correct template is rendered' do
      expect(response).to render_template(:show)
    end

    it 'to users#show the response body includes the right placeholder' do
      expect(response.body).to include('his page was called by user Id:')
    end
  end
end
