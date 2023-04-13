Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update, :destroy], as: :manage_users

  devise_for :users
  root to: "pages#home"
  resources :courses
  # Show enrolments for currently signed-in user
  get "users/:id/enrolments", to: "enrolments#index", as: :enrolments
  # Enrol in course for currently signed-in user
  get "courses/:id/enrol", to: "enrolments#create", as: :enrol_new

  resources :users do
    get 'manage', on: :member
  end
  get 'users', to: 'users#index'

  resources :users do
    member do
      put :add_admin # add this line to define the route
    end
  end

  resources :enrolments, only: [:index], path: 'my-learning', as: 'user_enrolments'
end
