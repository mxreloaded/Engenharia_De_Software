Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    defaults(format: :json) do
      namespace :v1 do
        resources :users
        resources :shopcarts, only: %i[create index show update]
        resources :products, only: %i[create index]
        resources :products_shopcarts, only: %i[create update delete]
        resources :categories, only: %i[index]
      end
    end
  end

  post 'api/v1/auth/login', to: 'authentication#login'
end
