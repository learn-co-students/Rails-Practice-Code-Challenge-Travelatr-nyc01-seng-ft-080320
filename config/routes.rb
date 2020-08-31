Rails.application.routes.draw do
  patch "posts/:id/like", to: "posts#add_like", as: "add_like"

  resources :bloggers
  resources :destinations
  resources :posts
  
  
  # get 'blogger/new'

  # get 'blogger/show'

  # get 'blogger/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
