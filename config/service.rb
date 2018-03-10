def self.google_calendar_client google_calendar_service=nil
    client = Google::APIClient.new
    client.authorization.client_id = ENV['GOOGLE_CLIENT_ID']
    client.authorization.client_secret = ENV['GOOGLE_SECRET_KEY']
    client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
    url_prefix = Rails.env.production? ? 'www.natasharico.com' : 'http://localhost:3000'
    client.authorization.redirect_uri = "#{url_prefix}/auth/google_oauth2/callback"
    if google_calendar_service.present?
        client.authorization.update_token! :access_token => google_calendar_service.token, :refresh_token => google_calendar_service.google_calendar_refresh_token, :expires_in => google_calendar_service.google_calendar_expires_in, :issued_at => Time.at(google_calendar_service.google_calendar_issued_at)
        client.authorization.fetch_access_token! if client.authorization.expired?
    end

    client
end
