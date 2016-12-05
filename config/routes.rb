Rails.application.routes.draw do
  devise_for :users
  get 'dashboard/index'

  root to: 'dashboard#index'
  resources :users do
    resources :exercises
  end
end
