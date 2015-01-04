Rails.application.routes.draw do

  # Rails Admin for backend project creation/approval
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'marketing#index'

  # Authentication routes
  resources :passwords, only: [:create, :new, :edit, :update]
  resource :session, only: [:create]
  resources :users

  get '/sign_up' => "users#new"
  get '/sign_in' => "sessions#new"
  delete '/sign_out' => "sessions#destroy"

  # User confirmation
  get '/users/:confirmation_token/confirm' => "users#confirm", :as => "user_confirmation"

  resources :projects
  resources :favorites
  resource :registry
  resource :partner_invite, :only => [:create, :destroy]

  # Main registry page, this must be after `resource :registry`
  get '/registry/:url_slug', to: 'registries#show'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do

      with_options :except => [:new, :edit] do |api|
        api.resources :users do
          api.resources :purchases
        end

        api.resource :registry

        api.resources :organizations do
          api.resources :projects do
            api.resources :items
          end
        end
      end

    end
  end
end