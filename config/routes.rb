Rails.application.routes.draw do    
  resources :users do 
    resources :activities
  end

  get '/activities/top_ten' => 'activities#top_ten'

  resources :activities do
    member do 
      put 'upvote' => 'activities#upvote'
      put 'downvote' => 'activities#downvote'
    end
  end


  resources :sessions 

  get '/auth/github/callback', to: 'sessions#create'

  get '/user/activities' => 'users#activities'
  
  root 'application#home'

  get '/signin' => 'users#new'
  post '/signin' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/activities/*location' => 'activities#location'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
