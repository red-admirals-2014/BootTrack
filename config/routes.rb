BootTrack::Application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  root :to => 'graduates#index'
  get 'graduates/search', :to => 'graduates#search'
  get 'graduates/locations', :to => 'graduates#locations'
  get 'graduates/by_location', :to => 'graduates#by_location'
  post 'graduates/mail', to: 'graduates#email'

  get 'graduates/update', to: 'graduates#update'

end
