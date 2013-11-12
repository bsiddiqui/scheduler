class SchedulesController < ApplicationController
  # I typically think a skip_before_filter would be a terrible idea but
  # the requirements didn't say anything about securing the API
  #
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
    schedule = Schedule.new(schedule_params)

    if schedule.save
      # valid schedule
      render json: SchedulePresenter.new(schedule).as_json, status: 201
    else
      # invalid schedule
      render json: schedule.errors, status: 404
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:trip_id, :price, :max_size, :time, wdays: [])
  end
end
