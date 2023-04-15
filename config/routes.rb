Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "pages#home"
  resources :courses do
    collection do
      get :fullstack
      get :data
    end
end
  # Show enrolments for currently signed-in user
  get "enrolments", to: "enrolments#index", as: :enrolments
  # Enrol in course for currently signed-in user
  get "courses/:id/enrol", to: "enrolments#create", as: :enrol_new
  # Add review to course
  # get "users/:user_id/enrolments/:enrolment_id/reviews/new", to: "reviews#new", as: :user_enrolment_reviews
  resources :enrolments do
    resources :reviews, only: %i[new create]
end
