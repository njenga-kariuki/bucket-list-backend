class Api::V1::DestinationsController < ApplicationController

  def create

    if Destination.find_by(city: destination_params[:city], country: destination_params[:country])
      @destination = Destination.find_by(city: destination_params[:city], country: destination_params[:country])
      @destination.trips.build(destination_params[:trips_attributes])
      render json: @destination, status: :accepted
    else
      @destination = Destination.create(destination_params)
      render json: @destination, status: :accepted
    end
    @destination.avg_monthly_temperature = @destination.fetchAnnualTemps
    @destination.save
  end

  def destination_params
    params.require(:destination).permit(
    :street_number,
    :street_name,
    :city,
    :state,
    :country,
    :postal_code,
    trips_attributes:[:trip_start,:trip_end,:user_id]
    )
  end
end
