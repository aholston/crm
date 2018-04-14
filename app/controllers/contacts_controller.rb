class ContactsController < ApplicationController
  before_action :authenticate

  def create
    contact = Contact.new(contact_val)
    if !params[:agent]
      client = Client.find(params[:id])
      contact.client = client
      contact.save
      return redirect_to "/clients/#{client.id}"
    else
      agent = Agent.find(params[:id])
      contact.agent = agent
      contact.save
      return redirect_to "/agents/#{agent.id}"
    end

  end
end
