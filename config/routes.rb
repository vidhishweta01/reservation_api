Rails.application.routes.draw do
  resources :bookings
  resources :services
  resources :work_schedules
  resources :spa_n_salons
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
