BootTrack::Application.routes.draw do

  root :to => 'graduates#index'
  get 'graduates/search', :to => 'graduates#search'
  get 'graduates/location', :to => 'graduates#location'
  post 'graduates/mail', to: 'graduates#email'
  get 'graduates/update', to: 'graduates#update'
end
