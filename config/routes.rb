Rails.application.routes.draw do

  get 'sample-registry', to: 'registries#sample_show'

  # Rails Admin for backend project creation/approval
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  if Rails.env.production?
    constraints subdomain: false do
      get ':any', to: redirect(subdomain: 'www', path: '/%{any}'), any: /.*/
    end
  end

  root 'marketing#index'
  post 'email_subscription', to: 'marketing#email_subscription'
  # Authentication routes
  resources :passwords, only: [:create, :new, :edit, :update]
  resource :session, only: [:create]
  resources :users
  get 'organizations/application', to: 'organizations#new', as: 'new_organization'
  resources :organizations do
    resources :reports
    resources :projects
  end

  get '/sign_up' => 'users#new'
  post '/sign_up' => 'users#create'
  get '/sign_in' => 'sessions#new'
  delete '/sign_out' => 'sessions#destroy'

  # User confirmation
  get '/users/:confirmation_token/confirm' => 'users#confirm', :as => 'user_confirmation'

  get '/projects/thank_you', to: 'projects#thank_you'
  get '/projects/:url_slug', to: 'projects#show'
  post '/projects/:url_slug/select', to: 'projects#select', as: 'select_project'
  get '/projects/:url_slug/modal', to: 'projects#modal', as: 'project_modal'

  resources :projects, except: [:show]
  resources :favorites

  post 'orders/:id/finalize' => 'orders#finalize', :as => 'orders_finalize'

  get '/registries/check_url_availability', to: 'registries#check_url_availability', as: 'check_url_availability'
  resources :registries, except: [:show] do
    get 'projects_and_categories', on: :collection
    get 'personalize', on: :member
    get 'finished', on: :member
    resources :orders, :only => [:show, :create]
  end

  resources :orders do
    resources :charges, :only => [:new, :create]
  end

  resources :partner_invites, :only => [:create, :destroy]

  # Main registry page, this must be after `resource :registry`
  get '/registries/:id/project', to: 'registries#project_registry_form', as: 'project_registry_form'
  get '/registries/:id/finishing_registry', to: 'registries#finishing_registry_form', as: 'finishing_registry_form'

  scope '/registry/:url_slug' do
    root to: 'registries#show', as: 'registry_home'
    get '/admin', to: 'registries#admin', as: 'registry_admin'
  end

  scope '/campaign/:url_slug' do
    root to: 'campaigns#show', as: 'campaign_home'
  end

  scope '/birthday/:url_slug' do
    root to: 'birthdays#show', as: 'birthday_home'
  end

  # Footer Link Pages
  get '/how-it-works' => 'marketing#how_it_works'
  get '/about-us' => 'marketing#about_us'
  get '/faq' => 'marketing#faq'
  get '/partner-with-us' => 'marketing#partner_with_us'
  get '/our-partners' => 'marketing#our_partners'
  get '/privacy-policy' => 'marketing#privacy_policy'
  get '/terms-of-use' => 'marketing#terms_of_use'
  get '/press' => 'marketing#press'

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
