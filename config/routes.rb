Rails.application.routes.draw do    

  resources :categories, only: [:show, :index]

  resources :users do 
    resources :activities
    resources :votes
  end

  post '/activities/:location' => 'activities#location'
  get '/activities/top_ten' => 'activities#top_ten'

  resources :activities do
    resources :votes
  end

  resources :sessions 

  get '/auth/github/callback', to: 'sessions#create'

  get '/user/activities' => 'users#activities'
  
  root 'application#home'

  get '/signin' => 'users#new'
  post '/signin' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

end
