Rails.application.routes.draw do    

  resources :users do 
    resources :activities
    resources :votes
  end

  post '/activities/:location' => 'activities#location'
  get '/activities/top_ten' => 'activities#top_ten'

  resources :activities do
    resources :votes
      #get ':location' => 'activities#location' something like this for location route?
  end

  resources :sessions 

  get '/auth/github/callback', to: 'sessions#create'

  get '/user/activities' => 'users#activities'
  
  root 'application#home'

  get '/signin' => 'users#new'
  post '/signin' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #order matters- make sure something else doesn't trump it
  #parameterized routes

  #this is routing to show rather than location--why?!

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
