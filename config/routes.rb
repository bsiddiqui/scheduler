Scheduler::Application.routes.draw do
  # TODO should this be post or get?
  get 'query_by_date', to: 'trips#query_by_date'

  resources :trips, only: [:index, :create] do
    resources :schedules, only: [:index, :create]
  end
end
