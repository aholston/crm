Rails.application.routes.draw do






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:index, :create, :edit]
  resources :users
  resources :clients
  resources :houses
  resources :vendors
  resources :events

  root    'sessions#index'
  get     'logout'            =>          'sessions#destroy'
  get     'tasks/:id'         =>          'tasks#create'
  delete  'tasks/:id'         =>          'tasks#destroy'
  post    'contracts/:id'     =>          'contracts#create'
  post    'contacts/:id'      =>          'contacts#create'
  get     'dashboard'         =>          'users#index'
  patch   'infos/:id'         =>          'infos#update'
  post    'attractions/:id'   =>          'attractions#create'
  post    'comments/:id'      =>          'comments#create'
  post    'showings/:id'      =>          'showings#create'
  get     'events/:id/:g_id'   =>          'events#show'


end
