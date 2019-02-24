Rails.application.routes.draw do

  get 'user/myPage' => "user#myPage"
  get  'logout' => "user#logout"
  post 'logout' => "user#logout"
  post 'user/create' => "user#create"
  get 'user/create' => "user#create"
  post 'login' => "user#login"
  get 'signup' => "user#signup"
  get 'login' => "user#login"
  get 'user/new' => "user#new"


  get 'practice' => "top#practice"
  get 'jobs/index' => "top#index"
  get '/' => "top#about"
  post 'jobs/create' => "top#create"
  post 'jobs/:id/cancel' => "top#cancel"
  post 'jobs/:id/join' => "top#join"
  post 'jobs/:id/destroy' => "top#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
