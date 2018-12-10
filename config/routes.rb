Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'boards#index'

  get 'boards/index', as: :boards
  get 'boards/new', to: "boards#new"
  get 'boards/:id/edit', to: "boards#edit"
  post 'boards/create'
<<<<<<< HEAD
  post 'boards/:id/destroy', to: "boards#destroy"

=======

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
>>>>>>> 6f704fcbfe9b12a3491e72edda2a4c40b5095d9b
end
