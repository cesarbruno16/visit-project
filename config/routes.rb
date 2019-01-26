Rails.application.routes.draw do
	devise_for :users
	root to: 'hotels#index'
	resources :hotels, only: [:index, :new, :create]

	resources :states, only: :index
	resources :cities, only: :index
end
