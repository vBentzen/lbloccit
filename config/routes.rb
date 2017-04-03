Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/about'

  root 'welcome#index' #start/default page
end
