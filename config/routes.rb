Rails.application.routes.draw do

  get 'home/index'
  get '/about_pranav' => 'home#about_pranav'
  get '/gallery' => 'home#gallery'
  get '/lessons' => 'home#lessons'
  get '/contact' => 'home#contact'

  root 'home#index'

end
