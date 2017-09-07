Rails.application.routes.draw do
  resources :idea_attachments
  resources :ideas
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get "profile" => "users#show"

  # Connecting facebook


  #home page
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
