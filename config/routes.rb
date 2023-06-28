# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api do
    api_version(module: 'Api::V1', path: { value: 'v1' }) do
      resources :movies, only: [:index] do
        collection do
          post :import
        end
      end
    end
  end
end
