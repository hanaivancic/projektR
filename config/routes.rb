Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :classrooms
    resources :students
    resources :teachers
    resources :decks
    resource :questions
    resource :schools
    resource :statistics
  end
end
