class ActivityGoogleResultsSerializer < ActiveModel::Serializer
  attributes :activity_data

  def activity_data
    {
      data: self.object.destination.fetchTopGoogleSearchResults(self.object.user.id)
    }

  end
end
