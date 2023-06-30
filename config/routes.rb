Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  namespace :api, path: '/' do
    namespace :v1, path: '/' do
      resources :users

      post '/scissor', to: 'shortened_urls#create'
      get '/:code', to: 'shortened_urls#redirect'

      # Authentication
      namespace :auth, path: '/' do
        post '/login', to: 'sessions#create'
        delete 'users/logout', to: 'users/sessions#destroy'
      end
    end

  end


  # root to: "shortened_urls#index"
  # get "/:short_url", to: "shortened_url#show"
  # get "shortened/:short_url", to: "shortened_urls#shortened", as: :shortened
  # post "/shortened_urls/create"
  # get "/shortened_urls/fetch_original_url"

  



end
