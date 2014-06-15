BootTrack::Application.routes.draw do

  root :to => 'graduates#index'
  get 'graduates/search', :to => 'graduates#search'
  get 'map/index', :to => 'map#index'
end
