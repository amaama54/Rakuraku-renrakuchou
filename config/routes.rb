Rails.application.routes.draw do
  devise_for :teachers
  devise_for :parents
  
  root to: "homes#top"
  get "/search", to: "searchs#search"
  
  #保護者側
  scope module: :parent do
    resources :connections, only: [:index, :show]
    resources :years, only: [:index]
    resources :checks, only: [:index]
  end
  
  #先生側
  namespace :teacher do
    resources :connections
    resources :years
  end
  
end
