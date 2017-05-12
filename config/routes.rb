Rails.application.routes.draw do
  root 'landing_pages#top'

  resources :blogs do
    post :confirm, on: :collection
  end
  resources :contacts, only: %w(new create)
end
