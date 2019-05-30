class TripNoteSerializer < ActiveModel::Serializer
  attributes :id, :note, :created_at, :user_data

  def user_data
    {
      id: self.object.user.id,
      first_name: self.object.user.first_name,
      last_name: self.object.user.last_name
    }
  end
end
