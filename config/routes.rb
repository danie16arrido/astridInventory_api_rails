Rails.application.routes.draw do
  get 'providers/index'

  get 'providers/create'

  get 'providers/show'

  get 'providers/update'

  get 'providers/destroy'

  scope path: 'api/v1' do
    resources :categories
    resources :devices
    resources :providers
    resources :orders
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
