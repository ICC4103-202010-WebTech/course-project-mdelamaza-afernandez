Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resuorces :users do
    resource :multimedium
    resources :mail_boxes

    resources :events, shallow: true do
      resources :guests, shallow: true
      resources :notifications, shallow: true
      resources :reports, shallow: true #reporte del evento

      resources :comments, shallow: true do
        resources :reports, shallow: true #reporte del comentario del evento
      end
    end

    resources :organizations, shallow: true do
      resources :memberships, shallow: true
    end

    resources :date_options, shallow: true do
      resources :votes
    end

  end

  resources :events, shallow: true do
    resources da
  end
end
