Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'boards#index'

  get 'boards/index', as: :boards
  get 'boards/new', to: "boards#new"
  post 'boards/create'
end
