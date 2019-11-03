require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :games

  resources :users do
    resource :parole, only:[:show, :update]
    resources :bucket_items, only:[:index, :create, :destroy]
  end
  
  root to: 'games#index'
end
