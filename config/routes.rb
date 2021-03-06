Rails.application.routes.draw do

  devise_for :users, controllers:{omniauth_callbacks: 'omniauth'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :conversations do
    resources :messages
  end
  resources :date_options do
    member do
      put "like" => "date_options#upvote"
    end
  end
  root "pages#home"
  get '/search' => 'pages#search', :as => 'search_page'
  get '/admin' => "pages#admin", :as => "admin"
  #Routs API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :comments
      resources :events do
        resources :comments
      end
    end
  end
  resources :comments
  resources :events
  resources :date_options
  resources :reports
  #
  resources :multimedia
  resources :guests
  resources :memberships
  resources :mail_boxes
  #
  resources :organizations
  resources :users do
    # resources :multimedium
    resources :mail_boxes

    resources :events, shallow: true do
      resources :guests, shallow: true
      resources :date_options, shallow: true
      resources :reports, shallow: true #reporte del evento
      resources :multimedia, shallow: true
      resources :comments, shallow: true do
        # resources :reports, shallow: true #reporte del comentario del evento
      end
    end
    resources :notifications, shallow: true
    resources :organizations, shallow: true do
      resources :memberships, shallow: true
    end
  end


end
