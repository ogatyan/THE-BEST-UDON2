Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "tweets/post" => "tweets#post"
  get "tweets/top" => "tweets#top"
  get "tweets/menu" => "tweets#menu"
  get "tweets/ranking" => "tweets#ranking"
  get "tweets/naibu" => "tweets#naibu"
  get "tweets/gaibu" => "tweets#gaibu"
  get "tweets/sougou" => "tweets#sougou"

  get 'tweets/:tweet_id/kennais' => 'kennais#create'
  get 'tweets/:tweet_id/kennais/:id' => 'kennais#destroy'
  get 'tweets/:tweet_id/kengais' => 'kengais#create'
  get 'tweets/:tweet_id/kengais/:id' => 'kengais#destroy'
  get "up" => "rails/health#show", as: :rails_health_check
  resources :tests
  resources :tweets do
    resources :kennais, only: [:create, :destroy]
    resources :kengais, only: [:create, :destroy]
  end
   root 'tweets#top'
  # Defines the root path route ("/")
  # root "posts#index"
end
