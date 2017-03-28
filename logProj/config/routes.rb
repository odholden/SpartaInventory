Rails.application.routes.draw do
  get 'welcome/index'




   # get '/logs/:id', to: 'logs#show'
  resources :logs do
  	  resources :logs, only: [:create]
  end


  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
