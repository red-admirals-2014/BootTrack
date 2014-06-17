BootTrack::Application.routes.draw do

  root to: 'graduates#index'
  get 'graduates/search', to: 'graduates#search'

  post 'graduates/mail', to: 'graduates#email'
end
