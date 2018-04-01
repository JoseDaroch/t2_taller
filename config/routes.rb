Rails.application.routes.draw do

  get 'sessions/new'

  root 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/administrator', to: 'static_pages#administrator'

  #API
resources :entries, path: 'news' do
  resources :comments
end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
