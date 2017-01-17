Rails.application.routes.draw do
  devise_for :users
  root  "chat_groups#index"
  resources :chat_groups, only: [:new, :edit, :create, :update] do
    resources :messages, only: [:index, :create]
  end
  resources :users , only: [:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
