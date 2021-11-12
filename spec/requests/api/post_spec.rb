require 'swagger_helper'

RSpec.describe 'api/post', type: :request do
  path '/api/v1/post/index' do
    get 'Retrieves the posts' do
      security [bearer_auth]
      response 200, 'posts found' do
        login_user
        let(:Authorization) { "Bearer #{@user.jti}" }
        run_test!
      end

      # response '404', 'blog not found' do
      #  let(:id) { 'invalid' }
      #  run_test!
      # end

      # response '406', 'unsupported accept header' do
      #  let(:Accept) { 'application/foo' }
      #  run_test!
      # end
    end
  end
end
