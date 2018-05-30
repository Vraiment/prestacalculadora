Rails.application.routes.draw do
  root 'loans#index'
  resources :loans
  # patch '/send_to_email/:id', to: 'loans#send_to_email', as: 'send_to_email'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
