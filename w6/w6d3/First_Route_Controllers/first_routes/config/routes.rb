Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :artworks, only: [:index]
  end

  
  
  # get 'users/', to: 'users#index'
  # get 'users/:id', to: 'users#show'
  # get 'users/new', to: 'users#new'
  # get 'users/:id/edit', to: 'users#edit'
  # post 'users/', to:'users#create'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'
  
  resources :artworks, only: [:create, :show, :update, :destroy]
    

  resources :artwork_shares, only: [:create, :destroy]


end
