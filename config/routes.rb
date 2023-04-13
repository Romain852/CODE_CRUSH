Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "pages#home"
  resources :courses
  # Show enrolments for currently signed-in user
  get "users/:id/enrolments", to: "enrolments#index", as: :enrolments
  # Enrol in course for currently signed-in user
  get "courses/:id/enrol", to: "enrolments#create", as: :enrol_new
  # Add review to course
  get "users/:id/enrolments/:id/reviews/new", to: "reviews#new", as: :new_review
end
