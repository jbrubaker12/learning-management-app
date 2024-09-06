Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations]
  devise_for :users
  resources :courses do 
    resources :lessons
  end
  
  # If we are authenticated as the admin user it will redirect the admin user to the admin#index controller
  authenticated :admin_user do
  	root to: "admin#index", as: :admin_root
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "admin" => "admin#index"
  # Defines the root path route ("/")
  root "courses#index"
end
