class DestinationSerializer < ActiveModel::Serializer
  attributes :street_number, :street_name, :city, :state, :country, :postal_code

  # , :avg_monthly_temperature, :hotel_data, :activity_data
  #
  #
  # # def avg_monthly_temperature
  # #   self.object.fetchAnnualTemps
  # # end
  # #
  # # def hotel_data
  # #   self.object.fetchHotelData
  # # end
  # #
  # # def activity_data
  # #   self.object.fetchTopGoogleSearchResults
  # # end
end
