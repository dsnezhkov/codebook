Reporter::Application.routes.draw do
  resources :classifications do
    resources :flaws
  end

  root "welcome#index"
end
