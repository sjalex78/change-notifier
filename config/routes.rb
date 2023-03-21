# frozen_string_literal: true

Rails.application.routes.draw do
  resources :teams, only: [:create] do
    collection do
      get :is_url_unique
    end
    member do
      get :fetch_fixture
    end
  end
  # a test only route used by spec/features/it_works_spec.rb
  get "test_root", to: "rails/welcome#index", as: "test_root_rails"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "teams#index"
end
