Rails.application.routes.draw do
  resources :idea_attachments

  resources :ideas

  resources :follows
  delete "unfollow" => "follows#destroy"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get "profile" => "users#show"
  get "profile"   => "users#profile"

  resources :reaches

  #like
  post "toggle_like" => "likes#toggle"


  #home page
  root "home#index"
  get "text" => "home#text"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :participates
end
