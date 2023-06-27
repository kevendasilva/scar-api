Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations, :passwords]
  devise_scope :user do
    # Sessions
    post   '/login',  to: 'users/sessions#create',  as: :user_session
    delete '/logout', to: 'users/sessions#destroy', as: :destroy_user_session
    # Registrations
    put    '/sign_up',  to: 'users/registrations#update', as: nil
    delete '/sign_up',  to: 'users/registrations#destroy', as: nil
    post   '/sign_up',  to: 'users/registrations#create', as: nil
    patch  '/sign_up',  to: 'users/registrations#update', as: :user_registration
  end

  authenticate do
    get '/current_user', to: 'current_user#index', as: nil
  end
end