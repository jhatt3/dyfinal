Rails.application.routes.draw do
  root 'contacts#new'

  get 'show' => 'contacts#show'
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
