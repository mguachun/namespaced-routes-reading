Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  scope '/admin' do
    resources :stats, only: [:index]
  end 
  

  root 'posts#index'


  get '/admin/stats', to: 'stats#index' 

  namespace :admin do
    resources :stats, only: [:index]
  end 
end
