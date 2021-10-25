Rails.application.routes.draw do
  get "/users/:user_id/posts", to: "posts#index" # usually requires a view
  get "/users/:user_id/posts/:id", to: "posts#show" # usually requires a view
  get "/users", to: "users#index" # usually requires a view
  get "/users/:id", to: "users#show" # usually requires a view  
end
