Rails.application.routes.draw do
  resources :owners, except: [:new, :create] do
    resources(:items)
  end

  resources(:items) do
    resources :measurements
  end

  resources :measurements
  get '/items', to: "items#index"
  get '/items/:id', to: "items#show"
  get '/signup', to: "owners#new", as: "signup"
  post '/signup', to: "owners#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get "/auth/facebook/callback", to: "sessions#create_with_fb"
  # resources(:items)

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end