Rails.application.routes.draw do
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: "sessions#destroy"

get 'users', to: "users#index"

resources :posts, only: [:index,:new,:create]
end
