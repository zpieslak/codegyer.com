Codegyver::Application.routes.draw do

  root 'pages#home'

  get "portfolio" => "pages#portfolio"
  get "services" => "pages#services"
  get "contact" => "messages#new"
  get "contact/success" => "messages#success"

  resources :messages, :only => [:new, :create]
  resources :subscriptions, :only => [:create] do
    collection do
      get 'unsubscribe/:token' => "subscriptions#unsubscribe", :as => "unsubscribe"
    end
  end
end
