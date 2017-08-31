Rails.application.routes.draw do
  resources :products
  resources :users do
    resources :placements, only:[:create]
  end
  resources :placements, only:[:index, :show]
  post 'authenticate', to: 'authentication#authenticate'  
end
