Rails.application.routes.draw do
  resources :users do
    resources :bookings
    resources :spa_n_salons do
      resources :work_schedule
      resources :services
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
