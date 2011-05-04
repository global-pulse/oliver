Oliver::Application.routes.draw do
  devise_for :users

  resources :pulse_applications

  resources :data_sources do
    resources :comments
  end
  
  resources :platforms
  
  resources :tools

  root :to => "application#index"
end
