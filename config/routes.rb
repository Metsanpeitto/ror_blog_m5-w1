Rails.application.routes.draw do
  resources :comments
  root to: "users#index"
  get "all_posts", to: 'posts#all_posts' 
  get  '/users/:user_id/posts/new',to: 'posts#new'
  post 'posts',to: 'posts#create'
  post 'posts/like_hit', to: 'posts#like_hit'
  
  resources :users do    
    resources :posts 
  end

  resources :posts do
    resources :comments, :likes  
  end
end
