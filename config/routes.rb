Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      # define single route test 
      get 'test', to: 'users#check'
      
      # define multiple routes using resources
      resources :users do 
        resources :facts
      end
    end
  end
end
