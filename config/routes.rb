Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'request', to: 'proofreading_apis#show'

  root to: 'proofreading_apis#index'
end
