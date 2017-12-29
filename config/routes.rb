Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :real_estates
    end
  end

  namespace :admin do
    resources :real_estates, only: [:index]
  end

  root to: "admin/real_estates#index"
end