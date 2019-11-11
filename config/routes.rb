require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :games

  resources :users do
    resource :parole, only:[:show, :update]
    resources :comments, only:[:index, :create, :update, :destroy]
    resources :bucket_items, only:[:index, :create, :destroy]
  end

  get 'tags/:tag', to: 'games#index', as: :tag
  root to: 'games#index'
end
