Rails.application.routes.draw do
  
get "recruits/index"
get "recruits/new"
get "recruits/:id" => "recruits#show"
end
