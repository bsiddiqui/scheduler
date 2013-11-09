class TripsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]
  respond_to :json

  def index
    @trips = Trip.all
    respond_with @trips
  end

  def show
  end

  def create
    @trip = Trip.new(
      name: params[:name],
      vendor: params[:vendor]
    )

    if @trip.save
      render json: @trip, status: 201
    else
      render json: @trip.errors, status: 404
    end
  end
end
