Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }

  root to: 'root#index'

  resources :store_items do
    get :tree, on: :collection
  end

  # Catch-all for react-router routes
  get '/*path', to: 'root#index'
end
