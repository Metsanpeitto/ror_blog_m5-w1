require 'swagger_helper'

RSpec.describe 'Post API', type: :request do
  path '/api/v1/post/index' do
    get 'list posts' do
      security [bearer_auth: []]
      response 200, 'successful request' do
        login_user
        let(:Authorization) { "Bearer #{@user.jti}" }

        run_test!
      end

      response 401, 'authentication error' do
        run_test!
      end
    end
  end
end
