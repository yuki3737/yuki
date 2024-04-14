Rails.application.routes.draw do
  get 'lectures/index'
  get 'lectures/new'
  resources :nihons
  resources :perfumes
  devise_for :users
  resources :users, only: [:show]
  resources :nihons do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
 
  resources :tags do
    get 'nihons', to: 'nihons#search'
  end
  
  root 'nihons#index'

  get 'lectures/index'  => 'lectures#index'
  get 'lectures/new'  => 'lectures#new'
  post 'lectures/new'  => 'lectures#create'
  get  'post_nihons'  =>  'nihons#post'
  
 



  
  
end
