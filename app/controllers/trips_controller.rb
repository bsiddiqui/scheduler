class TripsController < ApplicationController
  # I typically think a skip_before_filter would be a terrible idea but
  # the requirements didn't say anything about securing the API
  #
  # don't require auth token for curl commands
  skip_before_filter :verify_authenticity_token, :only => [:index, :create]
  respond_to :json

  # responds with all trips
  def index
    trips = Trip.all
    respond_with trips
  end

  # creates a new trip
  def create
    trip = Trip.create(trip_params)

    respond_with trip
  end

  # responds with trips that fall within a specific to/from date
  def query_by_date
    # find the wdays of the trip
    dates = dates_to_wdays(
      Date.parse(params[:from]),
      Date.parse(params[:to])
    )

    # find schedules that fit the wdays of the trip
    schedules = Schedule.where.overlap(wdays: dates)

    respond_with TripsBySchedulePresenter.new(schedules).as_json
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :vendor)
  end

  # returns an array of unique wdays between two dates
  def dates_to_wdays (start_date, end_date)
    start_date.upto(end_date).to_a.inject([]) do |dates, t|
      return dates if dates.include? t.wday
      dates << t.wday
    end
  end
end
