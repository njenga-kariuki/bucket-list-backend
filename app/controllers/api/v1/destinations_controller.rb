class Api::V1::DestinationsController < ApplicationController

  #CREATE -- no if logic to check if destination exists yet
  def create
    @destination = Destination.new(destination_params)

    if @destination.save
      render json: @destination, status: :accepted
    else
      render json: {errors: @destination.errors.full_messages}, status: :unproccessible_entity
    end
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
