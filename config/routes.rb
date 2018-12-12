Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :boards
  root 'boards#index'
  get 'boards/index', as: :boards
  get 'boards/new', to: "boards#new"
  get 'boards/:id/edit', to: "boards#edit"
  post 'boards/create'
  post 'boards/:id/update', to: "boards#update"
  post 'boards/:id/destroy', to: "boards#destroy"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
