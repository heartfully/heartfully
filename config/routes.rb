Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Auth routes
  resources :passwords, only: [:create, :new, :edit, :update]
  resource :session, only: [:create]
  resources :users

  get '/sign_up' => "users#new"
  get '/sign_in' => "sessions#new"
  delete '/sign_out' => "sessions#destroy"
  get '/users/:confirmation_token/confirm' => "users#confirm", :as => "user_confirmation"

  # Heartful.ly routes
  root 'marketing#index'

  get '/registry/:url_slug', to: 'registries#show'

  resources :projects

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do

      with_options :except => [:new, :edit] do |api|
        api.resources :users do
          api.resources :purchases
        end

        api.resources :couples do
          api.resource :registry
        end

        api.resources :organizations do
          api.resources :projects do
            api.resources :items
          end
        end
      end

    end
  end
end