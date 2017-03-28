Rails.application.routes.draw do

  ######### users #####
  
  # get 'users/index'

  # get 'users/show'

  # get 'users/edit'

  # get 'users/update'

  # get 'users/delete'

  # get 'users/new'

  # get 'users/create'

  ######### items #####

  # get 'items/index'

  # get 'items/show'

  # get 'items/edit'

  # get 'items/update'

  # get 'items/delete'

  # get 'items/new'

  # get 'items/create'


	devise_for :users

	resources :logs

  resources :items

  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
