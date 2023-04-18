Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :courses do
    collection do
      get :fullstack
      get :data
    end
  end

  Rails.application.routes.draw do
    get '/my_courses', to: 'courses#my_courses'
  end


  resources :courses do
    get "enrolments", to: "enrolments#index", as: :enrolments
    get "enrol", to: "enrolments#create", as: :enrol_new, on: :member
  end

  resources :users, only: [:index, :show, :edit, :update, :destroy], as: :manage_users do
    get 'manage', on: :member
    put :add_admin, on: :member
  end

  resources :enrolments do
    resources :reviews, only: [:new, :create]
  end

  get 'users', to: 'users#index'

  get 'dashboard', to: 'pages#dashboard'

  resources :reviews, only: [:new, :create, :edit, :update, :destroy]

end
