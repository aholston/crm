class EventsController < ApplicationController

  def new
    @event = Event.new
    respond_to do |format|
      # if the response fomat is html, redirect as usual
      format.html { redirect_to root_path }

      # if the response format is javascript, do something else...
      format.js { }
    end
  end

  def show
    @eventID = params[:id]
    @source = params[:g_id]

    respond_to do |format|
      # if the response fomat is html, redirect as usual
      format.html { redirect_to root_path }

      # if the response format is javascript, do something else...
      format.js { }
    end
  end

  def update
    @event = Event.find(params[:id])


  if @event.update(event_params)
    render :nothing => true

    unless @event.google_event_id.nil?
      client = Google::APIClient.new
      client.authorization.access_token = current_user.token
      service = client.discovered_api('calendar', 'v3')

      result = client.execute(:api_method => service.events.get, :parameters => {'calendarId' => 'landon.marder@gmail.com', 'eventId' => @event.google_event_id } )

      event = result.data
      event.summary = @event.title
      event.start.dateTime = @event.start_time
      event.end.dateTime = @event.end_time
      event.description = @event.description
      event.location = @event.location

      result = client.execute(:api_method => service.events.update,
                              :parameters => {'calendarId' => 'landon.marder@gmail.com', 'eventId' =>  @event.google_event_id},
                              :body_object => event,
                              :headers => {'Content-Type' => 'application/json'})
    end
  else
    render :nothing => true
  end
  end
end
