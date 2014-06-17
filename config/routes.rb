BootTrack::Application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  root :to => 'graduates#index'
  get 'graduates/search', :to => 'graduates#search'
  get 'map/index', :to => 'map#index'
end
