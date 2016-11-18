Rails.application.routes.draw do
  root :to => 'home#index'

  get 'log_in' => 'sessions#new'
end
