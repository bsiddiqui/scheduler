Scheduler::Application.routes.draw do
  # TODO should this be post or get?
  get 'query', to: 'schedules#query'

  resources :trips, only: [:index, :create] do
    resources :schedules, only: [:index, :create]
  end
end
