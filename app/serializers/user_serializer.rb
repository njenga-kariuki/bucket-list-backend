class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :default_airport_code, :default_departure_city, :trips
  has_many :trips
end
