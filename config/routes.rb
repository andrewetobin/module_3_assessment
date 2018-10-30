Rails.application.routes.draw do
  root "welcome#index"

  post '/search', to: 'search#index'

  namespace :api do
    namespace :v1 do
      get '/games/:game_id', to: 'games#show'
      post '/games/:game_id/plays', to: 'games/plays#create'

    end
  end

end
