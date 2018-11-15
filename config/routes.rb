Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get 'home', to: 'plants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # changement
  resources :plants, except: [:index] do
    resources :carings, except: [:destroy]
  end

  get 'history', to: 'carings#history'
  patch 'accept/:id', to: 'carings#accept', as: 'accept'
  patch 'decline/:id', to: 'carings#decline', as: 'decline'
end
