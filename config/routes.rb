Rails.application.routes.draw do
  devise_for :users
  resources :comments
  root "users#index"
  post '/users/:user_id/posts/new',to: 'posts#new'
  post 'posts',to: 'posts#create'
  post 'posts/like_hit', to: 'posts#like_hit'
  
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
