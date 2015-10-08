ChiliCookoffVoter::Application.routes.draw do

  root :to => "home#index"

  resources :events do
    resources :attendances
    resources :categories
    resources :entries

    member do
      get :results
      post :all_done
      get :success
    end
  end
  resources :ratings

  resources :users, :only => [:index, :show, :edit, :update ]
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
