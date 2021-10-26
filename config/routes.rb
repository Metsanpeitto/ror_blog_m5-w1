Rails.application.routes.draw do
  resources :users
  resources :posts
  get "/obtain_all_posts", to: 'users#obtain_all_posts'
  get "/users/:user_id/posts", to: "posts#index" # usually requires a view
  get "/users/:user_id/posts/:id", to: "posts#show" # usually requires a view
  root "users#index"
end
