Rails.application.routes.draw do
  root to: "welcome#index"

  namespace :apis do
    namespace :v1 do
      get 'poem', to: "poems#show"
    end
  end
end
