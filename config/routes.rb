Rails.application.routes.draw do
  resources :pledgers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pledgers#index'
end