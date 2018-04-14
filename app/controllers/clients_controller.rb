class ClientsController < ApplicationController
  before_action :authenticate

  def index

      @clients = Client.search(params[:search]).includes(:houses, :buyer, :investor).order(:first_name).where.not(first_name: 'None')
    

    # @clients = Client.includes(:houses, :buyer, :investor).order(:updated_at)
    @clients = @clients.page(params[:page]).per(15)
  end

  def create
    client = Client.create(client_val)
    if !client.errors.full_messages.empty?
      flash[:errors] = client.errors.full_messages
    end
    if params[:category] == 'buyer'
      @buyer = true
      @client = client
      return render 'buyer'
    elsif params[:category] == 'investor'
      @investor = true
      @client = client
      return render 'buyer'
    end
    return redirect_to '/clients'
  end

  def category
    client = Client.find(params[:client])
    if params[:buyer]
      buyer_val[:cash] = no_comma(buyer_val[:cash])
      buyer = Buyer.new(buyer_val)
      client.buyer = buyer
      buyer.save
      client.save
      return redirect_to '/clients'
    elsif params[:investor]
      investor = Investor.new(investor_val)
      client.investor = investor
      investor.save
      client.save
      return redirect_to '/clients'
    else
      flash[:errors] = 'Something went wrong, please try again!'
      return redirect_back
    end


  end

  def edit
    @client = Client.find(params[:id])
  end

  def show
    @client = Client.find(params[:id])
    @contacts = @client.contacts
  end

  def update
    client = Client.find(params[:id])

    client.update(client_val)
    if client.buyer and !params[:list_adjust]
      buyer = client.buyer
      buyer.update(buyer_val)
    elsif client.investor and !params[:list_adjust]
      investor = client.investor
      investor.update(investor_val)
    end
    redirect_to "/clients"
  end

  def destroy
    client = Client.find(params[:id])
    client.destroy
    redirect_to '/clients'
  end


end
