require 'swagger_helper'

RSpec.describe 'api/authentication_controller', type: :request do
  path 'create' do
    get 'Creates clinet' do
      tags 'Posts', 'Another Tag'
      produces 'application/json', 'application/xml'

      response '200', 'post founds' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 text: { type: :string }
               },
               required: %w[id title text]

        let(:id) { Post.all }
        run_test!
      end
    end

    # path '/blogs/{id}' do
    #  get 'Retrieves a blog' do
    #    tags 'Blogs', 'Another Tag'
    #    produces 'application/json', 'application/xml'
    #    parameter name: :id, in: :path, type: :string

    #    response '200', 'blog found' do
    #      schema type: :object,
    #             properties: {
    #               id: { type: :integer },
    #               title: { type: :string },
    #               content: { type: :string }
    #             },
    #             required: %w[id title content]

    #      let(:id) { Blog.create(title: 'foo', content: 'bar').id }
    #      run_test!
    #    end

    #    response '404', 'blog not found' do
    #      let(:id) { 'invalid' }
    #      run_test!
    #    end

    #    response '406', 'unsupported accept header' do
    #      let(:Accept) { 'application/foo' }
    #      run_test!
    #    end
    #  end
    # end
  end
end
