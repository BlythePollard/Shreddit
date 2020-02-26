Rails.application.routes.draw do    
  resources :users do 
    resources :activities
  end

  resources :activities 

  resources :sessions 

  get '/user/activities' => 'users#activities'
  
  root 'application#home'

  get '/signin' => 'users#new'
  post '/signin' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/activities/*location' => 'activities#location'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
