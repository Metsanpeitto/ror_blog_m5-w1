require 'rails_helper'

RSpec.describe 'User', type: :request do
  it 'to users#index returns a 200 custom status code' do
    get '/users'
    expect(response).to have_http_status('200')
  end

  it 'to users#index the correct template is rendered' do
    get '/users'
    expect(response).to render_template(:index)
  end

  it 'to users#index the response body includes the right placeholder' do
    get '/users'
    expect(response.body).to include('Here is a list of users')
  end

  it 'to users#show returns a 200 custom status code' do
    get '/users/1'
    expect(response).to have_http_status('200')
  end

  it 'to users#show the correct template is rendered' do
    get '/users/1'
    expect(response).to render_template(:show)
  end

  it 'to users#show the response body includes the right placeholder' do
    get '/users/1'
    expect(response.body).to include('his page was called by user Id:')
  end
end
