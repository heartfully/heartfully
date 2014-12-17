Rails.application.routes.draw do

  devise_for :users

  root 'marketing#index'

  get '/registry/:couple_slug', to: 'registries#show'

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