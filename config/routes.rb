Rails.application.routes.draw do
    resources :users
    resources :pills do
      resources :alerts
    end
    put 'pills/:id/taken', to: 'pills#take_pill'
    post 'auth/login', to: 'authentication#authenticate'
    post 'signup', to: 'users#create'

end
