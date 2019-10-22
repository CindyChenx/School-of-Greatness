Rails.application.routes.draw do
  resources :coaches
  resources :appointments
  resources :goals
  resources :users, accept: [:new] do
    resources :goals
  end

  get "/signup" => "users#new", as: "signup"
  get "/login" => "sessions#new", as: "login"
  get '/auth/:provider/callback', to: 'sessions#create'
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
