class TripsController < ApplicationController
  # don't require auth token for curl commands
  skip_before_filter :verify_authenticity_token, :only => [:index, :create]
  respond_to :json

  # responds with all trips
  def index
    @trips = Trip.all
    respond_with @trips
  end

  # creates a new trip
  def create
    @trip = Trip.new(
      name: params[:name],
      vendor: params[:vendor]
    )

    if @trip.save
      # valid trip
      render json: @trip, status: 201
    else
      # invalid trip
      render json: @trip.errors, status: 404
    end
  end
end
