Rails.application.routes.draw do
  resources :lists
  resources :posts
  resources :categories
  post "people/remote_index", to: "people#remote_index", constraints: lambda {|req| req.format == :json}
  resources :people do
    collection do
      get :simple_index
      get :remote_index
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "people#index"
end
