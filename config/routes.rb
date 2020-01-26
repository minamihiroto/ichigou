Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
post "organizers/login" => "organizers#login"
post"organizers/logout" => "organizers#logout"
get "organizers/login" => "organizers#login_form"

post "participants/login" => "participants#login"
post"participants/logout" => "participants#logout"
get "participants/login" => "participants#login_form"

resources :organizers
resources :recruits
resources :participants
end
