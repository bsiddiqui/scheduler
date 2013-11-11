class SchedulesController < ApplicationController
  # don't require auth token for curl commands
  skip_before_filter :verify_authenticity_token, :only => [:index, :create]
  respond_to :json

  # responds with all schedules for a given trip
  def index
    @schedules = Schedule.where(trip_id: params[:trip_id])
    respond_with @schedules
  end

  # creates a new schedules for a given trip
  def create
    @schedule = Schedule.new(
      trip_id: params[:trip_id],
      price: params[:price],
      max_size: params[:max_size],
      wday: params[:wday],
      time: params[:time]
    )

    if @schedule.save
      # valid schedule
      render json: @schedule, status: 201
    else
      # invalid schedule
      render json: @schedule.errors, status: 404
    end
  end

  # responds with trips that fall within a specific to/from date
  # TODO should this be a method in trip?
  def wday_to_datetime
    case date

    end
  end
end
