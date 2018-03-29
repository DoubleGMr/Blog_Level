Rails.application.routes.draw do

  root 'pages#index'
  get '/about',to:'pages#about'
  get '/contact',to:'pages#contact'

  get '/signup',to:'users#new'
  post '/signup',to:'users#create'

  get '/login',to:'sessions#new'
  post '/login',to:'sessions#create'
  delete '/logout',to:'sessions#destroy'

  resources :users
  resources :account_activations, only:[:edit]
  resources :password_resets, only:[:new,:create,:edit,:update]
  resources :posts
  resources :tags,except:[:index,:show]
  resources :comments, only:[:create]
  resources :replies, only:[:create]
  resources :messages, only:[:index,:create,:destroy]
  resources :dashboard, only: [:index]

  match 'all_messages_delete', to: 'messages#delete_all', via: :delete

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
