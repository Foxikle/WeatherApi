Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :debug, only: [:show]
      resource :snapshot, only: [:show]
      resource :latest, only: [:show]
      resource :post, only: [:show]
      resource :range, only: [:show]
    end
  end
end
