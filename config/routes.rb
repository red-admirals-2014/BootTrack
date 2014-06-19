BootTrack::Application.routes.draw do

  root :to => 'graduates#index'
  get 'graduates/search', :to => 'graduates#search'
  get 'graduates/locations', :to => 'graduates#locations'
  get 'graduates/by_location', :to => 'graduates#by_location'
  post 'graduates/mail', to: 'graduates#email'
end
