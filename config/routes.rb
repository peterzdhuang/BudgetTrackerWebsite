Rails.application.routes.draw do
  root "spendings#index"
  resources :spendings, only: [ :index, :show, :create, :update, :destroy ]
end
