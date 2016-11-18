Rails.application.routes.draw do
  root :to => 'home#index'

  get "log_out" => "sessions#destroy"
  get 'log_in' => 'sessions#new'
  # get "sign_up" => "users#new", :as => "sign_up"

  resources :sessions
end
