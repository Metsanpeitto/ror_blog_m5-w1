Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: { registrations: 'registrations' }
    namespace :api do
    namespace :v1 do
      get 'post/index'
      post :id, to: 'post#comments'
      post :new_comment, to: 'post#new_comment'
      post :auth, to: 'authentication#create'
      get  '/auth' => 'authentication#fetch'
    end
    namespace :v2 do
      # Things yet to come
    end
  end

  root "users#index"
  post '/users/:user_id/posts/new',to: 'posts#new'
  post '/posts/:post_id/comments/new', to: 'comments#new'
  post '/posts',to: 'posts#create'
  post '/posts/like_hit', to: 'posts#like_hit'
  
  resources :users do
    member do
      get :confirm_email
    end    
    resources :posts 
  end

  resources :posts do
    resources :comments, :likes  
  end
end

