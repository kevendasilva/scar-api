Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations, :passwords]
  devise_scope :user do
    # Sessions
    post   '/login',    to: 'users/sessions#create',       as: :user_session
    delete '/logout',   to: 'users/sessions#destroy',      as: :destroy_user_session
    # Registrations
    put    '/sign_up',  to: 'users/registrations#update',  as: nil
    delete '/sign_up',  to: 'users/registrations#destroy', as: nil
    post   '/sign_up',  to: 'users/registrations#create',  as: nil
    patch  '/sign_up',  to: 'users/registrations#update',  as: :user_registration
  end
  
  authenticate do
    # Current User
    get    '/current_user',   to: 'current_user#index', as: nil
    # Door Locks
    get    '/door_locks',     to: 'door_locks#index',   as: :door_locks
    post   '/door_locks',     to: 'door_locks#create',  as: nil
    get    '/door_locks/:id', to: 'door_locks#show',    as: :door_lock
    patch  '/door_locks/:id', to: 'door_locks#update',  as: nil
    put    '/door_locks/:id', to: 'door_locks#update',  as: nil
    delete '/door_locks/:id', to: 'door_locks#destroy', as: nil
    # Clients
    get    '/clients',     to: 'clients#index',   as: :clients
    post   '/clients',     to: 'clients#create',  as: nil
    get    '/clients/:id', to: 'clients#show',    as: :client
    patch  '/clients/:id', to: 'clients#update',  as: nil
    put    '/clients/:id', to: 'clients#update',  as: nil
    delete '/clients/:id', to: 'clients#destroy', as: nil
  end
end