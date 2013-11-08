Scheduler::Application.routes.draw do
  resources :trips, only: [:index, :create]
end
