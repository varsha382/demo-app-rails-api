Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    post '/sign_up', to: 'users#create', as: :sign_up

    post '/log_in', to: 'sessions#create', as: :log_in
    delete '/log_out', to: 'sessions#destroy', as: :log_out
  end
end
