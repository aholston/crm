# require 'google/apis/calendar_v3'
# require 'google/api_client/client_secrets'
# require 'signet/oauth_2/client'
# require 'googleauth'
# require 'googleauth/stores/file_token_store'
# require 'fileutils'
# require "net/http"
#
#
#
#
class EventsController < ApplicationController
#
#   # def refresh_token!
#   #   url = URI.encode('https://accounts.google.com/o/oauth2/token')
#   #   uri = URI.parse(url)
#   #   puts uri
#   #   response = Net::HTTP.post(uri,
#   #           { body: {
#   #               "user": 'nrico19@gmail.com',
#   #               "grant_type": self.refresh_token,
#   #               "client_id": ENV['GOOGLE_CLIENT_ID'],
#   #               "client_secret": ENV['GOOGLE_SECRET_KEY'],
#   #               "refresh_token": params[:session_state]
#   #             }}.to_json)
#   #       response = JSON.parse(response.body)
#   #       puts response
#   #       update_attributes(
#   #           access_token: response["access_token"],
#   #           expires_at: Time.now + response["expires_in"].to_i.seconds
#   #           )
#   #   end
#
#
# #   APPLICATION_NAME = 'Google Calendar'
# #   CLIENT_SECRETS_PATH = 'client_secrets.json'
# #   CREDENTIALS_PATH = File.join(Dir.home, "/natasha/natasha/secrets.yaml")
# #   SCOPE = 'https://www.googleapis.com/auth/calendar'
# #   URL = URI.encode('http://localhost:3000/auth/google_oauth2/callback/')
# #   def authorize
# #   FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))
# #
# #
# #   client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
# #   token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
# #   authorizer = Google::Auth::UserAuthorizer.new(
# #   client_id, SCOPE, token_store)
# #   puts authorizer
# #   user_id = params[:authuser]
# #   access_type = 'offline'
# #   credentials = authorizer.get_credentials(user_id)
# #   if credentials.nil?
# #     refresh_token!
# #     url = authorizer.get_authorization_url(
# #       base_url: 'https://accounts.google.com/o/oauth2/auth')
# #
# #     code = params[:code]
# #     credentials = authorizer.get_and_store_credentials_from_code(
# #       user_id: user_id, code: code, base_url: URL)
# #   end
# #   @credentials
# # end
#   def create
#     puts google_calendar_client
#   end
  def new

    respond_to do |format|
      # if the response fomat is html, redirect as usual
      format.html { redirect_to root_path }

      # if the response format is javascript, do something else...
      format.js { }
    end
  end

  def show
      respond_to do |format|
      # if the response fomat is html, redirect as usual
      format.html { redirect_to root_path }

      # if the response format is javascript, do something else...
      format.js { }
    end
  end
#
#   def update
#     puts 'in update'
#     @google_calendar_url = Service.google_calendar_client.authorization.authorization_uri.to_s
#     puts @google_calendar_url
#     # @calendar = Calendar::CalendarService.new
#     # @calendar.authorization = Signet::OAuth2::Client.new(
#     #   :authorization_uri => 'https://accounts.google.com/o/oauth2/auth',
#     #   :token_credential_uri =>  'https://www.googleapis.com/oauth2/v3/token',
#     #   :client_id => ENV['GOOGLE_CLIENT_ID'],
#     #   :client_secret => ENV['GOOGLE_SECRET_KEY'],
#     #   :scope => 'https://www.googleapis.com/auth/calendar',
#     #   :redirect_uri => 'https://localhost:3000/oauth',
#     #   refresh_token:        params[:session_state]
#     # )
#     # @calendar.authorization = authorize
#
#
#
#     # auth = Signet::OAuth2::Client.new(
#     #   access_type: 'offline',
#     #    token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
#     #    client_id:            ENV['GOOGLE_CLIENT_ID'],
#     #    client_secret:        ENV['GOOGLE_SECRET_KEY'],
#     #    scope:                ['https://www.googleapis.com/auth/calendar', 'https://www.googleapis.com/auth/plus.login'],
#     #    redirect_uri:         'http://localhost:3000/auth/google_oauth2/callback/',
#     #    authorization_code:          params[:code]
#     #
#     #
#     #  )
#     #  # puts 'here'
#     #  # puts auth.refresh_token
#     #  # puts 'here'
#     #  # auth.update_token!(user_credentials)
#     #  puts auth.authorization_code
#     #
#     #  auth.fetch_access_token!
#
#
#     # Calendar = Google::Apis::CalendarV3 # Alias the module
#     # calendar = Calendar::Apis::CalendarV3::CalendarService.new
#     # calendar.authorization = auth
#     # puts @calendar.get_calendar_list('primary')
#
#
#     redirect_to '/dashboard'
#
#   end
# end
end
