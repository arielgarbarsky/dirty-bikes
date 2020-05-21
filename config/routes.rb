Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  resources :bikes, only: [:new, :create, :index, :show] do
    resources :bookings, only: [:new, :create]
  end
end
