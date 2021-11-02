Rails.application.routes.draw do
  root to: "users#index"
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
