Rails.application.routes.draw do

  # Rails Admin for backend project creation/approval
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  if Rails.env.production?
    constraints subdomain: false do
      get ':any', to: redirect(subdomain: 'www', path: '/%{any}'), any: /.*/
    end
  end

  root 'marketing#index'
  resources :marketing, only: [:show]
  # Authentication routes
  resources :passwords, only: [:create, :new, :edit, :update]
  resource :session, only: [:create]
  resources :users
  get 'organizations/application', to: 'organizations#new', as: 'new_organization'
  resources :organizations do
    resources :reports
    resources :projects
  end

  get '/sign_up' => 'marketing#new_inquiry'
  post '/sign_up' => 'marketing#create_inquiry', :as => 'inquirers'
  get '/sign_in' => 'sessions#new'
  delete '/sign_out' => 'sessions#destroy'

  # User confirmation
  get '/users/:confirmation_token/confirm' => 'users#confirm', :as => 'user_confirmation'

  get '/projects/thank_you', to: 'projects#thank_you'
  get '/projects/:url_slug', to: 'projects#show'
  post '/projects/:url_slug/select', to: 'projects#select', as: 'select_project'

  resources :projects, except: [:show]
  resources :favorites

  post 'orders/:id/finalize' => 'orders#finalize', :as => 'orders_finalize'

  resources :registries, except: [:show] do
    resources :orders, :only => [:show, :create]
  end

  resources :orders do
    resources :charges, :only => [:new, :create]
  end

  resources :partner_invites, :only => [:create, :destroy]

  # Main registry page, this must be after `resource :registry`
  get '/registry/:url_slug', to: 'registries#show', as: 'registry_home'

  # Footer Link Pages
  get '/about-us' => 'marketing#about_us'
  get '/faq' => 'marketing#faq'
  get '/partner-with-us' => 'marketing#partner_with_us'
  get '/our-partners' => 'marketing#our_partners'
  get '/privacy-policy' => 'marketing#privacy_policy'
  get '/terms-of-use' => 'marketing#terms_of_use'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      with_options :except => [:new, :edit] do |api|
        api.resources :users do
          api.resources :purchases
        end

        api.resource :registry

        api.resources :projects do
          api.resources :items
        end

        api.resources :organizations
      end
    end
  end
end
