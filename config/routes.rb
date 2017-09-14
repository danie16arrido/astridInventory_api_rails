Rails.application.routes.draw do
  scope path: 'api/v1' do
    resources :categories
    resources :devices
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
