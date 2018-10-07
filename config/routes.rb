Rails.application.routes.draw do

  get 'likes/index'

  get 'l_ikes/index'

  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:index, :create, :destroy]
    end
  end

  devise_for :users
  resources :users, only: [:show]

  root 'welcome#index'

  post :incoming, to: 'incoming#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
