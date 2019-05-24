class Api::V1::TripsController < ApplicationController

  def index
    @trip_data = Trip.get_all_trip_details
    render json: @trip_data, status: :accepted
  end

  def hotel_data
    @hotel_data = Trip.get_hotel_data
    render json: @hotel_data, status: :accepted
  end


  def trip_details
    @trip = Trip.find(params[:id])
    render json: {trip: TripOverviewSerializer.new(@trip)}
  end

  def activity_data
    @activity_data = Trip.get_activity_data
    render json: @activity_data, status: :accepted
  end
end
