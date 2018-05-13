require 'google/apis/calendar_v3'
require 'google/api_client/client_secrets'

class UsersController < ApplicationController
  before_action :authenticate


  def index
    today = Date.today
    month = Date.today.strftime('%m')
    day = Date.today.strftime('%d')
    @user = User.find(session[:user_id])
    @clients = Client.where("date_part('month', birthday) = ? AND date_part('day', birthday) = ?", month, day)
    @urgents = Client.includes(:contacts).where.not(first_name: 'None', listing: 'Dead')
    @todays_events = []


    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])



    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client



    event_list = service.list_events(cal_id)
    event_list.items.each do |event|

        if event.start.date
          if event.start.date.to_date == today
            event = {
              "summary": event.summary,
              "time": event.start.date.to_datetime + 12.hours
            }
            @todays_events << event
          end
        elsif event.start.date_time
          if event.start.date_time.to_date == today
            event = {
              "summary": event.summary,
              "time": event.start.date_time
            }
            @todays_events << event
          end
        end
    end





  rescue Google::Apis::AuthorizationError
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    



  end


  def new
    @user = User.find(session[:user_id])
  end

  def create
    user = User.new(user_val)
    user.save
    session[:user_id] = user.id
    redirect_to '/dashboard'
  end

  def update
    user = User.find(session[:user_id])
    if user.try(:authenticate, user_val[:password])
      user.update!(user_val)
    else
      flash[:errors] = 'Invalid Password'
    end
    return redirect_to "/sessions/#{user.id}/edit"
  end

  private
    def client_options
      {
        client_id: ENV['GOOGLE_CLIENT_ID'],
        client_secret: ENV['GOOGLE_SECRET_KEY'],
        authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
        token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
        scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
        redirect_uri: 'http://localhost:3000/oauth2callback',
        access_type: 'offline',
        prompt: 'consent'
      }
    end

    def cal_id
      id = 'XXXXX@group.calendar.google.com'
      return id
    end
end
