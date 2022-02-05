Rails.application.routes.draw do
  resources :categories
  resources :people do
    collection do
      get 'simple_index'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "people#index"
end
