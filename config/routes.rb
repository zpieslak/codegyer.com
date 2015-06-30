Rails.application.routes.draw do
  # Devise routes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Root
  root 'pages#home'

  get 'services' => 'pages#services'
  get 'contact' => 'messages#new'
  get 'contact/success' => 'messages#success'
  get 'posts/page/:page' => 'posts#index'

  resources :messages, only: [:new, :create]
  resources :projects, only: [:index, :show]
  resources :posts, only: [:index, :show]
  resources :subscriptions, only: [:create] do
    collection do
      get 'unsubscribe/:token' => 'subscriptions#unsubscribe', :as => 'unsubscribe'
    end
  end

  %w(404 422 500).each do |code|
    get code, to: 'pages#not_found', code: code
  end
end
