class TripsController < ApplicationController
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
    trip = Trip.new(
      name: params[:name],
      vendor: params[:vendor]
    )

    if trip.save
      # valid trip
      render json: trip, status: 201
    else
      # invalid trip
      render json: trip.errors, status: 404
    end
  end

  # responds with trips that fall within a specific to/from date
  def query_by_date
    dates = dates_to_wdays(
      Date.parse(params[:from]),
      Date.parse(params[:to])
    )

    schedules = Schedule.where.overlap(wdays: dates)
    json = {}

    schedules.each do |s|
      name = Trip.where(id: s.trip_id).first.name
      schedule = SchedulePresenter.new(s).as_json
      if json[name]
        json[name] << schedule
      else
        json[name] = [schedule]
      end
    end

    respond_with json
  end

  private

  # returns an array of unique wdays between two dates
  def dates_to_wdays (start_date, end_date)
    dates = []
    start_date.upto(end_date).to_a.each do |t|
      dates << t.wday
    end
    dates.uniq
  end
end
