class Town < ActiveRecord::Base
  before_validation :geolo
  attr_reader :weathername, :weatherTemperature
   @weathername
  @weatherTemperature

public
  

  
def meteo
    weather = ForecastIO.forecast(self.latitude, self.longitude, params:{units: 'si'})
    if weather
      today = weather.currently
      if today
        if today.summary
          @weathername = today.summary
        else
          @weathername = "null"
        end
        if today.temperature
          @weatherTemperature = today.temperature
        else
          @weatherTemperature = "null"
        end
      end
    end
 end 
  
  
 private 
  
  
  
  def geoloc
    loc = Nominatim.search(self.name).limit(1)
    city = loc.first
    if city
      self.latitude = city.lat
      self.longitude = city.lon
    end
  end
end
