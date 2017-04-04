Rails.application.routes.draw do
  root 'pages#show', page: 'home'

  get  'signup' => 'users#new'
  post 'signup' => 'users#create'

  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
