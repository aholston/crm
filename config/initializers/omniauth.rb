# # Rails.application.config.middleware.use OmniAuth::Builder do
# #   provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_SECRET_KEY'],
# #
# #
# #   {
# #     scope: ['https://www.googleapis.com/auth/calendar', 'https://www.googleapis.com/auth/plus.login'],
# #     skip_jwt: true
# #   }
# #
# #
# # end
#
# # def self.google_calendar_client google_calendar_service=nil
# #     client = Google::APIClient.new
# #     client.authorization.client_id = ENV['GOOGLE_CLIENT_ID']
# #     client.authorization.client_secret = ENV['GOOGLE_SECRET_KEY']
# #     client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
# #     url_prefix = Rails.env.production? ? 'www.natasharico.com' : 'http://localhost:3000'
# #     client.authorization.redirect_uri = "#{url_prefix}/auth/google_oauth2/callback"
# #     if google_calendar_service.present?
# #         client.authorization.update_token! :access_token => google_calendar_service.token, :refresh_token => google_calendar_service.google_calendar_refresh_token, :expires_in => google_calendar_service.google_calendar_expires_in, :issued_at => Time.at(google_calendar_service.google_calendar_issued_at)
# #         client.authorization.fetch_access_token! if client.authorization.expired?
# #     end
# #
# #     client
# # end
#
# require 'google/apis/calendar_v3'
# require 'googleauth'
# require 'googleauth/stores/file_token_store'
#
# require 'fileutils'
#
# OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
# APPLICATION_NAME = 'Google Calendar'
# CLIENT_SECRETS_PATH = 'client_secrets.json'
# CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
#                              "calendar-api.yaml")
# SCOPE = 'https://www.googleapis.com/auth/calendar'
#
# ##
# # Ensure valid credentials, either by restoring from the saved credentials
# # files or intitiating an OAuth2 authorization. If authorization is required,
# # the user's default browser will be launched to approve the request.
# #
# # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
# def authorize
#   FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))
#
#   client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
#   token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
#   authorizer = Google::Auth::UserAuthorizer.new(
#     client_id, SCOPE, token_store)
#   user_id = 'default'
#   credentials = authorizer.get_credentials(user_id)
#   if credentials.nil?
#     url = authorizer.get_authorization_url(
#       base_url: OOB_URI)
#     puts "Open the following URL in the browser and enter the " +
#          "resulting code after authorization"
#     puts url
#     code = gets
#     credentials = authorizer.get_and_store_credentials_from_code(
#       user_id: user_id, code: code, base_url: OOB_URI)
#   end
#   credentials
# end
#
# # Initialize the API
# service = Google::Apis::CalendarV3::CalendarService.new
# service.client_options.application_name = APPLICATION_NAME
# service.authorization = authorize
#
# # Fetch the next 10 events for the user
# calendar_id = 'primary'
# response = service.list_events(calendar_id,
#                                max_results: 10,
#                                single_events: true,
#                                order_by: 'startTime',
#                                time_min: Time.now.iso8601)
#
# puts "Upcoming events:"
# puts "No upcoming events found" if response.items.empty?
# response.items.each do |event|
#   start = event.start.date || event.start.date_time
#   puts "- #{event.summary} (#{start})"
# end
