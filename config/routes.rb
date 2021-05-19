Rails.application.routes.draw do
  root to: "home#top"
  devise_for :users
  resources :users
  get 'home/about' => "home#about"

  resources :reviews
  resources :books
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
