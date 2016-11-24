Rails.application.routes.draw do
  root :to => 'home#index'

  get "log_out" => "sessions#destroy"
  get 'log_in' => 'sessions#new'

  resources :sessions
end
