Rails.application.routes.draw do
  root to: 'restaurants#index'

  resources :restaurants do
    resources :day_schedules, only: [:edit, :update]
    resources :dining_tables, except: [:index, :show] do
      resources :reservations, only: [:new, :create, :destroy]
    end
  end
end
