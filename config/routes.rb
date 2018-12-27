Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'user_token' => 'user_token#create'

  # User actions
  #get     '/users'              => 'users#index'
  get     '/users/current'      => 'users#current'
  post    '/users'              => 'users#create'
  #'patch   '/users/password/:id' => 'users#update_password'
  #patch   '/users/:id'          => 'users#update'
  #delete  '/users/:id'          => 'users#destroy'

  get '/category_properties'  => 'category_properties#index'
  get '/coverages'            => 'coverages#index'
  get '/assistances'          => 'assistances#index'
  get '/assistance_packages'  => 'assistance_packages#index'

  get '/quotes'               => 'quotes#index'
  post '/quotes'              => 'quotes#create'
end
