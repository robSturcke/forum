Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  get 'about' => 'welcome#about'

  devise_for :users

  root 'welcome#index'
end
