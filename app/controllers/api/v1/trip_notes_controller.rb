class Api::V1::TripNotesController < ApplicationController

  def create
    @trip_note = TripNote.create(trip_note_params)
    if @trip_note.valid?
      render json: {trip_note: TripNoteSerializer.new(@trip_note)}
    else
      render json: { error: 'failed to create trip' }, status: :not_acceptable
    end
  end


  private
  def trip_note_params
    params.require(:trip_note).permit(
      :note,
      :trip_id,
      :user_id
    )
  end
end
