# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  scope module: :api, path: :api do
    scope module: :v1, path: :v1 do
      resources :disbursements, only: %i[index]
    end
  end
end
