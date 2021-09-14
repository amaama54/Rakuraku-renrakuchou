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
    resources :teachers, only: [:show] do
      resource :follow_requests, only:[:create, :destroy]
    end
  end
  
  #先生側
  namespace :teacher do
    resources :connections
    resources :years
    resources :teachers, only: [:show, :edit, :update] do
      resources :parent_follows, only:[:destroy, :show, :index]
      post '/follow_requests/:id' => 'follow_requests#allow', as: 'allow'
      resources :follow_requests, only:[:index, :show, :destroy]
    end
  end
  
end
