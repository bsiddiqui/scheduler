class SchedulesController < ApplicationController
  # don't require auth token for curl commands
  skip_before_filter :verify_authenticity_token, :only => [:index, :create]
  respond_to :json

  # responds with all schedules for a given trip
  def index
    schedules = Schedule.where(trip_id: params[:trip_id])
    respond_with schedules
  end

  # creates a new schedules for a given trip
  def create
    schedule = Schedule.new(
      trip_id: params[:trip_id],
      price: params[:price],
      max_size: params[:max_size],
      time: params[:time],
      wdays: JSON.parse(params[:wdays])
    )

    if schedule.save
      # valid schedule
      render json: SchedulePresenter.new(schedule).as_json, status: 201
    else
      # invalid schedule
      render json: schedule.errors, status: 404
    end
  end
end
