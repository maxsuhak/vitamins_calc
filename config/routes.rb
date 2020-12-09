Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :food_intake, only: %i[index new create]
  resources :activity_level, only: %i[index new create]
  resources :recipes, only: %i[index create show]

  root to: 'dashboard#index'

  match '*not_found', to: 'errors#error404', via: %i[get post]
end
