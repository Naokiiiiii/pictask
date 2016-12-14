  Rails.application.routes.draw do
    root 'tasks#index'
    get 'tasks' => 'tasks#index'
    get 'tasks/new'  => 'tasks#new'
    post 'tasks'      =>  'tasks#create'
  end