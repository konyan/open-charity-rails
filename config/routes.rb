Rails.application.routes.draw do

  devise_for :users


  namespace :admin do
    get '', to: 'dashboard#index', as: ''
    resources :charities
    resources :transactions
  end

  post 'donate', to: 'website#donate', as: 'donate'

  root to: 'website#index'

end
