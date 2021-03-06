Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms, only: %i[index create] do
    resources :messages, only: %i[index create]
  end
  resources :messages, only: %i[destroy]
  mount ActionCable.server => '/cable'
end
