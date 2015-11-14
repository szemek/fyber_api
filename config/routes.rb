Rails.application.routes.draw do
  root 'dashboard#index'

  post '/' => 'offers#index', as: :offers
end
