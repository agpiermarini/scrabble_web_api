Rails.application.routes.draw do
  root "welcome#index"

  get :word_search, to: "word_search#index"


  namespace :api do
    namespace :v1 do
      namespace :games do
        get '/:id', to: "games#show"
        post '/:id/plays', to: "plays#create"
      end
    end
  end
end
