require 'google/apis/calendar_v3'
require 'google/api_client/client_secrets'
class EventsController < ApplicationController
  def redirect
    client = Signet::OAuth2::Client.new(client_options)

    redirect_to client.authorization_uri.to_s
  end

  def callback
    client = Signet::OAuth2::Client.new(client_options)
    client.code = params[:code]

    response = client.fetch_access_token!

    session[:authorization] = response

    redirect_to '/dashboard'
  end





  def new
    respond_to do |format|
      # if the response fomat is html, redirect as usual
      format.html { redirect_to root_path }

      # if the response format is javascript, do something else...
      format.js { }
    end
  end

  def create
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    event = Google::Apis::CalendarV3::Event.new(
      summary: params[:summary],
      description: params[:description],
      start: {
        date: params[:start_time],
        time_zone: 'America/Los_Angeles',
      },
      end: {
        date: params[:end_time],
        time_zone: 'America/Los_Angeles',
      }
    )
    result = service.insert_event(params[:calendar_id], event)
    redirect_to '/dashboard'
  end

  def show
    session[:event] = params[:id]
    session[:calendar_id] = params[:gID] + '@group.calendar.google.com'
    puts "Session Event: #{session[:event]}"
      respond_to do |format|
        # if the response fomat is html, redirect as usual
        format.html { redirect_to root_path }

        # if the response format is javascript, do something else...
        format.js { }
      end
  end


  def update

    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    event = service.get_event(session[:calendar_id], session[:event])
    session[:event] = nil
    event.summary = params[:summary] unless params[:summary].empty?
    event.description = params[:description] unless params[:description].empty?
    result = service.update_event(session[:calendar_id], event.id, event)
    session[:calendar_id] = nil
    redirect_to '/dashboard'
  end

  def destroy
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    event = service.get_event(session[:calendar_id], session[:event])
    session[:event] = nil

    service.delete_event(session[:calendar_id], event.id)
    session[:calendar_id] = nil
    redirect_to '/dashboard'
  end

  private
    def client_options
      {
        client_id: ENV['GOOGLE_CLIENT_ID'],
        client_secret: ENV['GOOGLE_SECRET_KEY'],
        authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
        token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
        scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
        redirect_uri: 'http://localhost:3000/oauth2callback'
      }
    end

end
