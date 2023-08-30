Rails.application.routes.draw do
  root 'home#index'
  resources :users, path: 'users' do
    resources :addresses, path: 'addresses'
    resources :companies, path: 'companies'
    resources :clients, path: 'clients'
    resources :invoices, path: 'invoices'
  end
end
