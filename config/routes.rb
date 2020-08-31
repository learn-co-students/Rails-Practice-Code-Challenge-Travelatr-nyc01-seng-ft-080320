Rails.application.routes.draw do

  #patch "/posts/:id", to: "posts#like", as: :like_post

  resources :bloggers
  resources :destinations
  resources :posts

 

end
