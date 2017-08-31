Rails.application.routes.draw do
  scope '/api' do
    resources :products
    resources :users do
      resources :placements, only:[:create]
    end
    resources :placements, only:[:index, :show]
    post 'authenticate', to: 'authentication#authenticate'
  end  
end
