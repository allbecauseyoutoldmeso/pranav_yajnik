Rails.application.routes.draw do

  get 'home/index'
  get '/about_pranav' => 'home#about_pranav'
  get '/about_kathak' => 'home#about_kathak'
  get '/gallery' => 'home#gallery'
  get '/contact' => 'home#contact'


  root 'home#index'

end
