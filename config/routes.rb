Rails.application.routes.draw do
resources :animals
end


# Below was an example of getting routers for some specific things before we've learned about resoureces:animals...
# get "/animals", to: "animals#index"
#  get "/animals/:id", to: "animals#show"