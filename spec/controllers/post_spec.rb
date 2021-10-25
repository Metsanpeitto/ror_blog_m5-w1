require 'rails_helper'

RSpec.describe 'Post', type: :request do
  it 'to posts#index returns a 200 custom status code' do
    get '/users/1/posts'
    expect(response).to have_http_status('200')
  end

  it 'to posts#index the correct template is rendered' do
    get '/users/1/posts'
    expect(response).to render_template(:index)
  end

  it 'to posts#index the response body includes the right placeholder' do
    get '/users/1/posts'
    expect(response.body).to include('Here is a list of posts for a given user')
  end

  it 'to posts#show returns a 200 custom status code' do
    get '/users/1/posts/1'
    expect(response).to have_http_status('200')
  end

  it 'to posts#show the correct template is rendered' do
    get '/users/1/posts/1'
    expect(response).to render_template(:show)
  end

  it 'to posts#show the response body includes the right placeholder' do
    get '/users/1/posts/1'
    expect(response.body).to include('The post loaded was:')
  end
end
