Rails.application.routes.draw do

post "applications/:recruit_id/create" => "applications#create"
post "applications/:recruit_id/destroy" => "applications#destroy"

post "organizers/login" => "organizers#login"
post"organizers/logout" => "organizers#logout"
get "organizers/login" => "organizers#login_form"

post "participants/login" => "participants#login"
post"participants/logout" => "participants#logout"
get "participants/login" => "participants#login_form"
get "participants/:id/applications" => "participants#applications"

resources :organizers
resources :recruits
resources :participants

root 'recruits#index'
end
