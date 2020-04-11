Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "art#index"

  resources :art, only: [:index, :create] do
    member do
      get "ascii"
    end
  end
end
