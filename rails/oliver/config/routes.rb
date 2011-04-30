Oliver::Application.routes.draw do
  devise_for :users

  resources :pulse_applications

  resources :data_sources
  
  resources :platforms
  
  resources :tools

  root :to => "application#index"
end
