Rails.application.routes.draw do
  devise_for :users

  root 'marketing#index'

  resource :user do
    resource :registry
    resources :purchases
  end

  resources :organizations do
    resources :projects
  end

end