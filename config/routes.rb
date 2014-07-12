Rails.application.routes.draw do
  
  root 'pages#index'

  # reserve page prefix for index, new, create
  resources :pages, only: %i[index new create]

  # there are no page prefix for show, edit, update, destroy
  resources :pages, path: '', except: %i[index new create]

  get '*id', to: 'pages#show'
end