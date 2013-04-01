Freetonight::Application.routes.draw do

  root :to => 'homes#show'
  resource :home

end
