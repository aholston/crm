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


    user = User.find(session[:user_id])

    if user.refresh_token.nil?
      user.refresh_token = response['ref']
      user.save
    end


    redirect_to '/dashboard'
  end



  def new_client
    house = House.find(params[:id])
    name = "#{house.client.first_name}  #{house.client.last_name}"
    date = Date.today()

    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    event = Google::Apis::CalendarV3::Event.new(
      summary: "Listing set up for #{house.address}",
      start: {
        date_time: date.to_datetime + (1.12/24),
        time_zone: 'America/Los_Angeles',
      },
      end: {
        date_time: date.to_datetime + (1.12/24),
        time_zone: 'America/Los_Angeles',
      }
    )
    puts event.start[:date_time]

    result = service.insert_event(cal_id, event)
    event.start[:date_time] = date.to_datetime + 3.days + 12.hours
    event.end[:date_time] = date.to_datetime + 3.days + 12.hours
    result = service.insert_event(cal_id, event)
    event.summary = "Listing maintenance for #{house.address}"
    result = service.insert_event(cal_id, event)
    event.summary = "#{house.address} on CSS"
    result = service.insert_event(cal_id, event)
    event.start[:date_time] = date.to_datetime + 5.days + 12.hours
    event.end[:date_time] = date.to_datetime + 5.days + 12.hours
    result = service.insert_event(cal_id, event)
    event.start[:date_time] = date.to_datetime + 10.days + 12.hours
    event.end[:date_time] = date.to_datetime + 10.days + 12.hours
    result = service.insert_event(cal_id, event)
    event.start[:date_time] = date.to_datetime + 15.days + 12.hours
    event.end[:date_time] = date.to_datetime + 15.days + 12.hours
    result = service.insert_event(cal_id, event)
    redirect_to '/houses'
  end

  def phase
    house = House.find(params[:id])
    name = "#{house.client.first_name}  #{house.client.last_name}"
    date = Date.today()

    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    event = Google::Apis::CalendarV3::Event.new(
      summary: "Contract follow with lender/buyer up for #{house.address}",
      start: {
        date: date,
        time_zone: 'America/Los_Angeles',
      },
      end: {
        date: date,
        time_zone: 'America/Los_Angeles',
      }
    )

    event.start[:date] = date + 5.days
    event.end[:date] = date + 5.days
    result = service.insert_event(cal_id, event)
    event.start[:date] = date + 10.days
    event.end[:date] = date + 10.days
    result = service.insert_event(cal_id, event)
    return redirect_to "/houses/#{house.id}"
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
    Time.zone = 'America/Chicago'
    start = DateTime.parse(params[:start_date]) + 5.hours
    finish = DateTime.parse(params[:end_date]) + 5.hours

    event = Google::Apis::CalendarV3::Event.new(
      summary: params[:summary],
      description: params[:description],
      start: Google::Apis::CalendarV3::EventDateTime.new(date_time: start),
      end: Google::Apis::CalendarV3::EventDateTime.new(date_time: finish),
      time_zone: 'America/Chicago'
    )
    result = service.insert_event(params[:calendar_id], event)
    redirect_to '/dashboard'
  end

  def show
    session[:event] = params[:id]
    session[:calendar_id] = 'XXXXX@group.calendar.google.com'

    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    @event = service.get_event(session[:calendar_id], session[:event])


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
        redirect_uri: 'http://www.localhost3000/oauth2callback',
        prompt: 'consent',
        access_type: 'offline'
      }
    end

    def cal_id
      id = 'XXXXX@group.calendar.google.com'
      return id
    end

end
