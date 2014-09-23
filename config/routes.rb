Rails.application.routes.draw do
  get 'static_pages/index'
  get '/signin', to: 'sessions#new'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'static_pages#index'
end
