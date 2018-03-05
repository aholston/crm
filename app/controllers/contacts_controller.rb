class ContactsController < ApplicationController
  before_action :authenticate

  def create
    client = Client.find(params[:id])
    contact = Contact.new(contact_val)
    contact.client = client
    contact.save
    redirect_to "/clients/#{client.id}"
  end
end
