require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user_with_posts) }

  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  # let(:invalid_attributes) do
  #  skip('Add a hash of attributes invalid for your model')
  # end

  describe 'GET #index' do
    before do
      user = FactoryBot.create(:user)
      user.confirm
      sign_in user
      get :index, format: 'html'
    end

    it 'to users#index returns a 200 custom status code' do
      expect(response).to have_http_status('200')
    end

    it 'to users#index the correct template is rendered' do
      expect(response).to render_template(:index)
    end

    # it 'to users#index the response body includes the right placeholder' do
    #  expect(response.body).to have_content('This cannot be cheese?')
    # end
  end
end
