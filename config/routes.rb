Reporter::Application.routes.draw do
  get "reports/index"
  get "metrics/index"
  get "search/index"
  
  resources :classifications do
    resources :flaws
  end

  root "welcome#index"
end
