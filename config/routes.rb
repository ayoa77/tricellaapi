Rails.application.routes.draw do
    resources :users do
        resources :pills
    end
end
