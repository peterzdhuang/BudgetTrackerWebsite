Rails.application.routes.draw do
  root "spendings#index"
  get "/:date", to: "spendings#daily", constraints: { date: /\d{4}-\d{2}-\d{2}/ }, as: :daily_spending
  resources :spendings, only: [ :index, :show, :create, :update, :destroy ]
end
