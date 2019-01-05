Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/accounts/customer', to: 'accounts#customer_accounts'
  post '/accounts', to: 'accounts#create'
end
