class ClientsController < ApplicationController
  before_action :authenticate

  def index
    @clients = Client.includes(:houses, :buyer, :investor)
  end

  def create
    client = Client.create(client_val)
    flash[:errors] = client.errors.full_messages
    return redirect_to '/clients'
  end

  def show
    @client = Client.find(params[:id])
    @contacts = @client.contacts
  end

  def update
    client = Client.find(params[:id])
    client.update(client_val)
    redirect_to "/clients/#{client.id}"
  end

end
