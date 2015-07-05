Rails.application.routes.draw do
	devise_for :users, :controllers => { registrations: 'registrations' }
  #devise_for :users
  resources :categories

  resources :articles do
    resources :comments, only: [:create, :update, :destroy] 
  end
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/contact'
  root 'welcome#index'
  get '/dashboard', to: "welcome#dashboard"
  
end
