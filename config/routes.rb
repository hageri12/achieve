Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #devise_for :users

  resources :blogs do
    resources :comments
    post :confirm, on: :collection
  end

  resources :contacts, only: [:new, :create] do
   collection do
     post :confirm
   end
  end

  root 'top#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :poems, only: [:index, :show]

  devise_for :users, controllers: {
    registrations:"users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }


end
