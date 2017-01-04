  Rails.application.routes.draw do
  devise_for :users
    post 'tasks/cash' => 'tasks#cash'
    root 'tasks#index'
    resources :tasks


    get   'users/:id'   =>  'users#show'

    get 'tasks/new' => 'tasks#new'
    post 'tasks' => 'tasks#create'
    get 'users/:id' => 'users#show'
    delete 'tasks/:id' => 'tasks#destroy'
    get 'tasks/:id/edit' => 'tasks#edit'
    patch 'tasks/:id'  => 'tasks#update'
    get 'tasks/:id' => 'tasks#show'
  end