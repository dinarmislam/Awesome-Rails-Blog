Rails.application.routes.draw do
  
  devise_for :users
  get '/archives', to: 'posts#archives'
  resources :posts do
  	resources:comments

  end

  

  root "posts#index"

  get '/about', to: 'pages#about'
  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'
end
