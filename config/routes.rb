Rails.application.routes.draw do
  resources :locations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "locations#new"
end
