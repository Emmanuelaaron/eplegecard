Rails.application.routes.draw do
  resources :pledgers, except: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/vatfevhsdgffgytfdshfhdfyrdcsfgcg', to: 'pledgers#index'
  root to: 'pledgers#new'
end
