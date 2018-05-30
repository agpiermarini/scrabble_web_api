Rails.application.routes.draw do
  root "welcome#index"

  get :word_search, to: "word_search#index"
end
