Rails.application.routes.draw do
  root to: "static_pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  delete 'delete_all_users', to: "static_pages#delete_all_users"

  devise_for :users, controllers: { 
      omniauth_callbacks: 'users/omniauth_callbacks'
     }
  # Defines the root path route ("/")
  # root "articles#index"
end
