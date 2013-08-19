Reporter::Application.routes.draw do
  get "search/index"
  
  resources :classifications do
    resources :flaws
  end

  root "welcome#index"
end
