Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  resource :users, only: [:new, :create]
  get 'about' => 'welcome#about'
  post 'users/confirm' => 'users#confirm'

  root 'welcome#index' # start/default page
end
