Phone::Application.routes.draw do
  root :to => 'home#index'
  devise_for :users
  resources :numbers
  resources :calls
  resources :contacts
  resources :scripts do
    resources :items
  end
  resources :mailboxes do
    resources :messages
  end
  match 'api' => 'api#index'
  match 'api/call' =>    'api#call'
  match 'api/menu' =>    'api#menu'
  match 'api/info' =>    'api#info'
  match 'api/music' =>   'api#music'
  match 'api/play' =>    'api#play'
  match 'api/message' => 'api#message'
  match 'api/mailbox' => 'api#mailbox'
  namespace :music do
    root :to => 'music#index'
    resources :artists do
      resources :songs
    end
  end
end
