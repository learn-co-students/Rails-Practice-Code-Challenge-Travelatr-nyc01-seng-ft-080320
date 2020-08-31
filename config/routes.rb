Rails.application.routes.draw do
    resources :bloggers, only:[:new, :create, :show, :index]
    resources :destinations, only:[:show]
    resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
