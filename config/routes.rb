Rails.application.routes.draw do
  root 'pages#show', page: 'home'

  get  'account' => 'users#show'
  get  'signup'  => 'users#new'
  get  'update'  => 'users#edit'
  post 'signup'  => 'users#create'
  put  'update'  => 'users#update'

  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
