require 'google/apis/calendar_v3'
require 'google/api_client/client_secrets'

@client_secrets = Google::APIClient::ClientSecrets.load
@auth_client = @client_secrets.to_authorization
@auth_client.update!(
  :scope => 'https://www.googleapis.com/auth',
  :redirect_uri => 'http://localhost:3000/oauthcallback',
  :additional_parameters => {
    "access_type" => "offline",         # offline access
    "include_granted_scopes" => "true"  # incremental auth
  }
)
puts @auth_client
@auth_uri = @auth_client.authorization_uri.to_s
