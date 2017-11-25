Rails.application.routes.draw do

  devise_for :admins

  get 'home/index'
  get '/about_pranav' => 'home#about_pranav'
  get '/gallery' => 'home#gallery'
  get '/contact' => 'home#contact'

  root 'home#index'

  resources 'photos'
  resources 'lessons'
  resources 'pranavs'
  resources 'videos'
  resources 'photo_placers'

end
