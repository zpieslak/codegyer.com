Codegyver::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#home'

  get "services" => "pages#services"
  get "contact" => "messages#new"
  get "contact/success" => "messages#success"

  resources :messages, :only => [:new, :create]
  resources :projects, :only => [:index, :show]
  resources :posts, :only => [:index, :show]
  resources :subscriptions, :only => [:create] do
    collection do
      get 'unsubscribe/:token' => "subscriptions#unsubscribe", :as => "unsubscribe"
    end
  end

  get "/404", "/422", "/500", :to => "pages#not_found"
end
