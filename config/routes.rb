Rails.application.routes.draw do
  resources :home
  root "home#index"

  get "/"=>"home#index"

  post "user/create"=>"user#create"
  get 'user/signup'=>"user#signup"
  get "user/login"=>"user#login_form"
  get "user/index"=>"user#index"
  post "user/login"=>"user#login"
  get "user/logout"=>"user#logout"
  post "user/:id/update"=>"user#update"
  get "user/:id"=>"user#detail"
  get "user/:id/edit"=>"user#edit"
  

  get "post/friend/new"=>"post#new"
  post "post/friend/create"=>"post#create"
  
end



