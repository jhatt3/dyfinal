Rails.application.routes.draw do
  get 'new' => 'contacts#new'

  root 'contacts#index'
  get 'show' => 'contacts#show'
  get 'name' => 'contacts#contacts_by_name'
  get 'cat' => 'contacts#contacts_by_category'
  get 'help' => 'contacts#help'
  get 'edit' => 'contacts#edit'
  get 'feedback' => 'contacts#feedback'
  
  # get "contacts/new" => 'contacts#new', :as => :new

  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
