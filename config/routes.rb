Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'
  get  '/help', to: 'static_pages#help'   # request for the URL /help to the help action in the Static Pages controller
  get  '/about', to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users #automatically ensures that our Rails application responds to the RESTful URLs
  resources :microposts, only: [:create, :destroy]
end
		