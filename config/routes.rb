Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")


  namespace :api do
    namespace :v1 do
      namespace :auth do
        post 'login', to: 'sessions#login'
      end
      resources :users
      resources :urls
    end
  end
end
