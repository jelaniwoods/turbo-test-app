Rails.application.routes.draw do
  # get "events" => "events#index"
  # get "public" => "public#index"
  # get "logs" => "logs#show"

  root "turbo#index"
  get "turbo/index"
  match "turbo/application_visits", via: [:get, :post]
  get "turbo/restoration_visits"
  get "turbo/canceling_visits"
  get "turbo/custom_rendering"
  get "turbo/pausing_rendering"
  get "turbo/pausing_requests"
  match "turbo/performing_visits_with_a_different_method", via: :all
  get "turbo/requiring_confirmation_for_a_visit"
  match "turbo/disabling_turbo_drive_on_specific_links_or_forms", via: [:get, :post]
  get "turbo/view_transitions"
  get "turbo/displaying_progress"
  get "turbo/reloading_when_assets_change"
  get "turbo/removing_assets_when_they_change"
  get "turbo/ensuring_specific_pages_trigger_a_full_reload"
  get "turbo/setting_a_root_location"
  get "turbo/form_submissions"
  match "turbo/redirecting_after_a_form_submission", via: [ :get, :post ]
  get "turbo/streaming_after_a_form_submission"
  get "turbo/prefetching_links_on_hover"
  get "turbo/preload_links_Into_the_cache"
  get "turbo/ignored_paths"

  # ----- old routes -----
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
  match "examples/nine", via: [:get, :post]
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
