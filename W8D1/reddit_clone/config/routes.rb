Rails.application.routes.draw do


  # new create edit update destroy show
  
  resources :posts, except: [:index, :create, :new]

  resources :subs do
    resources :posts, only: [:create, :new]
  end

  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  resource :session, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
