Rails.application.routes.draw do
  resources :galleries, excpet: [:show]
  get 'gallery/:id', to: 'galleries#show', as: 'gallery_show'
  
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :blogs

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
