Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :bikes, only: [:new, :create, :show] do
    resources :bookings, only: [:new, :create]
  end
end
