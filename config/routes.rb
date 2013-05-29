ShirtManagementApp::Application.routes.draw do
  resources :vendors

  root "shirts#index"
  get "/search", to: "shirts#search"
  resources :shirts
end
