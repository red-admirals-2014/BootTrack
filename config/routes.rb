BootTrack::Application.routes.draw do

  root :to => 'alumni#index'
  get 'alumni/search', :to => 'alumni#search'
end
