Rails.application.routes.draw do
  get 'comments/new/:id', to: 'comments#new', as: 'comments_new'
  post 'comments/create/:id', to: 'comments#create', as: 'comments_create'

  get '/users/index'
  get '/photos/index/:id', to: 'users#show', as: 'user'

  get '/users/login'
  post '/users/post_login'
  post '/users/logout'

  get 'photos/new'
  post 'photos/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
