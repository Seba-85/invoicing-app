Rails.application.routes.draw do
  root 'home#index'
  resources :users, path: 'users' do
    resources :addresses, path: 'addresses'
  end
end
