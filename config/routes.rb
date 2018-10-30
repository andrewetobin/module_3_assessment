Rails.application.routes.draw do
  root "welcome#index"

  post '/search', to: 'search#index'

end
