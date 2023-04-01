Rails.application.routes.draw do
  root to: "welcome#index"

  namespace :apis do
    namespace :v1 do
      get 'generate/poems', to: "poems#show"
      get 'search/poems', to: "poems#search"
    end
  end
end
