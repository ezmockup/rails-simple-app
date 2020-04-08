Rails.application.routes.draw do
  get "example/test"
  post "example/billease", to: "example#updateOrderBillease"
end
