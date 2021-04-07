Rails.application.routes.draw do
  get '/users/index'
  get '/photos/index/:id', to: 'users#show', as: 'user'

  get '/users/login'
  post '/users/post_login'
  post '/users/logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
