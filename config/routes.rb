Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end

  resources :menu_items
  resources :cart_items
  resources :orders
  resources :carts, only: [:create, :show, :destroy] do
    member do
      post :place_order
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
