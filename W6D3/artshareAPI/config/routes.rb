Rails.application.routes.draw do
  # get 'users/:id', to: 'users#index'
  # get 'users/:id', to: 'users#show', as: 'user'
  # post 'users', to: 'users#create'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

  resources :users, only: [:create, :index, :show, :destroy, :update]
  resources :artworks, only: [:create, :show, :index, :destroy, :update]

  resources :artwork_shares, only: [:create, :destroy]
  
  get 'users/:user_id/artworks', to: 'artworks#index'

  resources :comments, only: [:create, :destroy, :index]









  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# get 'users/:id', to: 'users#show', as: 'user'