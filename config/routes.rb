Rails.application.routes.draw do
  # root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :tvshows, only: :show
  root 'trakttv#get_trending'
  get '/api'          => 'trakttv#api'
  get '/get_token'    => 'trakttv#get_token'
  get '/get_trending' => 'trakttv#get_trending'
  get '/search'       => 'trakttv#search'
  get '/get_popular'  => 'trakttv#get_popular'
end
