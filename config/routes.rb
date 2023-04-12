Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "pages#home"
  resources :courses
  get "users/:id/enrolments", to: "enrolments#index"
end
