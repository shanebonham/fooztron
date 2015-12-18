Fooztron::Application.routes.draw do
  resources :games
  resources :teams
  resources :players do
    collection do
      get 'hidden'
    end
  end

  resource :sessions, only: [:new, :create, :destroy]

  post '/auth/:provider/callback', to: 'sessions#create'

  get 'leaderboard' => 'players#leaderboard'
  get 'leaderboard/:number' => 'players#leaderboard'
  root :to => 'games#index'
end
