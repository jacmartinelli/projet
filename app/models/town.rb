class Town < ActiveRecord::Base
  before_validation :geoloc
  def geoloc
    loc = Nominatim.search(self.name).limit(1)
    self.latitude = loc.first.lat
    self.longitude = loc.first.lon
  end
end
