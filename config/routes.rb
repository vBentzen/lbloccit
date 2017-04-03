Rails.application.routes.draw do
  root 'welcome#index' #start/default page

  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/contact'


end
