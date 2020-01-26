Rails.application.routes.draw do
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
