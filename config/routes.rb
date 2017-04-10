Rails.application.routes.draw do
  resources :posts

  get 'about' => 'welcome#about'

  root 'welcome#index' #start/default page
end
