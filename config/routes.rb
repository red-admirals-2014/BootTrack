BootTrack::Application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  root :to => 'graduates#index'
  get 'graduates/search', :to => 'graduates#search'
  get 'graduates/location', :to => 'graduates#location'

  post 'graduates/mail', to: 'graduates#email'

end
