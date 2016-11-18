Rails.application.routes.draw do
  resources :posts

  get 'about' => 'welcome#about'

  devise_for :users

  root 'welcome#index'
end
