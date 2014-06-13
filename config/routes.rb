BootTrack::Application.routes.draw do

 resources :alumnis, :only => [:index]

end
