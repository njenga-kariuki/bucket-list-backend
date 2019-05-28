class DestinationSerializer < ActiveModel::Serializer
  attributes :street_number, :street_name, :city, :state, :country, :postal_code, :latitude, :longitude

end
