Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :new, :create, :show] do
    resources :goals, only: [:new]
  end
  resources :sessions
  resources :goals, except: [:index, :new]
end
