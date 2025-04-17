Rails.application.routes.draw do
  root "turbo#application_visits"
  get "turbo/application_visits"
  get "turbo/restoration_visits"
  get "turbo/canceling_visits"
  get "turbo/custom_rendering"
  get "turbo/pausing_rendering"
  get "turbo/pausing_requests"
  match "turbo/performing_visits_with_a_different_method", via: :all
  get "md" => "application#md"

  # root "examples#one"
  post "/" => "examples#one"
  get "examples/one"
  get "examples/two"
  post "examples/two"
  get "examples/three"
  post "examples/three"
  get "examples/four"
  get "examples/five"
  post "examples/five"
  get "examples/six"
  get "examples/seven"
  get "examples/eight"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
