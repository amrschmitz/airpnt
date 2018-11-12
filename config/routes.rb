Rails.application.routes.draw do
  get 'carings/new'
  get 'carings/create'
  get 'carings/index'
  get 'carings/show'
  get 'carings/edit'
  get 'carings/update'
  get 'carings/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :plants do
    resources :carings
  end
end
