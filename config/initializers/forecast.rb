ForecastIO.configure do |configuration|
  configuration.api_key = Rails.application.secrets.secret_api_forecast
end