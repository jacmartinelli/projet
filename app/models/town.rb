class Town < ActiveRecord::Base
  before_validation :geoloc
  def geoloc
    loc = Nominatim.search(self.name).limit(1)
    city = loc.first
    if city
      self.latitude = city.lat
      self.longitude = city.lon
    end
  end
end
