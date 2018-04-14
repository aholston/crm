class HousesController < ApplicationController
  before_action :authenticate

  def index
    @houses = House.search(params[:search]).order(:updated_at).page(params[:page]).per(15)
    @clients = Client.all.where.not(first_name: 'None')
  end

  def create
    if house_val[:client_id] == ''
      client = Client.new(client_val)
      house_val[:price] = no_comma(house_val[:price])
      house_val[:sqft] = no_comma(house_val[:sqft])
      house = House.create(house_val)
      house.commission = commission(house.price)
      house.phase = 0
      house.client = client
      client.save
      house.save
      infolist = Infolist.create(house: house)
      make_info(infolist)
      return redirect_to "/tasks/#{house.id}"
    elsif house_val[:client_id] == 'dummy'
      if Client.find_by_first_name('None')
        client = Client.find_by_first_name('None')
        house_val[:price] = no_comma(house_val[:price])
        house_val[:sqft] = no_comma(house_val[:sqft])
        house = House.create(house_val)
        house.commission = commission(house.price)
        house.phase = 0
        house.client = client
        client.save
        house.save
        infolist = Infolist.create(house: house)
        make_info(infolist)
        return redirect_to "/tasks/#{house.id}"
      else
        client = Client.new(first_name: 'None', last_name: 'None')
        house_val[:price] = no_comma(house_val[:price])
        house_val[:sqft] = no_comma(house_val[:sqft])
        house = House.create(house_val)
        house.commission = commission(house.price)
        house.phase = 0
        house.client = client
        client.save
        house.save
        infolist = Infolist.create(house: house)
        make_info(infolist)
        return redirect_to "/tasks/#{house.id}"
      end
    else
      client = Client.find(house_val[:client_id])
      house_val[:price] = no_comma(house_val[:price])
      house_val[:sqft] = no_comma(house_val[:sqft])
      house = House.create(house_val)
      house.commission = commission(house.price)
      house.phase = 0
      house.client = client
      house.save
      client.save
      infolist = Infolist.create(house: house)
      make_info(infolist)
      return redirect_to "/tasks/#{house.id}"
    end
  end

  def show
    @house = House.find(params[:id])
    @infolist = @house.infolists.first.infos
    @list = @house.infolists.first
    count = 0
    @infolist.each do |list|
      count = count +1
    end
    @housecomments = Comment.where("topic = '0'")
    @showings = @house.showings
  end

  def edit
    @house = House.find(params[:id])
    @clients = Client.all.where.not(first_name: 'None')
  end

  def update
    house = House.find(params[:id])
    house.update(house_val)
    house.save
    redirect_to '/houses'
  end

  def destroy
    house = House.find(params[:id])
    house.destroy
    redirect_to '/houses'
  end
end
