Rails.application.routes.draw do

  root 'logs#index'

	get '/logs/list', to: 'logs#list'

	get '/bye', to: 'welcome#bye'

	get '/edit/:id', to: 'items#edit'

  # devise_for :users

  resources :users

  resources :logs

  resources :items

  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
