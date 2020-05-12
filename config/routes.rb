Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "pages#home"
  resources :users do
    resources :multimedium
    resources :mail_boxes

    resources :events, shallow: true do
      resources :guests, shallow: true
      resources :reports, shallow: true #reporte del evento

      resources :comments, shallow: true do
        resources :reports, shallow: true #reporte del comentario del evento
      end
    end
    resources :notifications, shallow: true
    resources :organizations, shallow: true do
      resources :memberships, shallow: true
    end

    resources :date_options, shallow: true do
      resources :votes
    end

  end

  resources :events, shallow: true do
    #resources da
  end
  #
  resources :guests
  resources :memberships
  resources :mail_boxes
  #
  resources :organizations
  #Routs API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events do
        resources :comments
      end
    end
  end
end
