class HousesController < ApplicationController
  before_action :authenticate

  def index
    @houses = House.all
    @clients = Client.all
  end

  def create
    house_val[:price] = no_comma(house_val[:price])
    house_val[:sqft] = no_comma(house_val[:sqft])
    house = House.create(house_val)
    house.commission = commission(house.price)
    house.phase = 1
    house.save
    infolist = Infolist.create(house: house)
    make_info(infolist)
    redirect_to "/tasks/#{house.id}"
  end

  def show
    @house = House.find(params[:id])
    @infolist = @house.infolist.infos
    count = 0
    @infolist.each do |list|
      puts list.name
      count = count +1
    end
    @housecomments = Comment.where("topic = '0'")
    @showings = @house.showings
  end

  def edit
    @house = House.find(params[:id])
    @clients = Client.all
  end

  def destroy
    house = House.find(params[:id])
    house.destroy
    redirect_to '/houses'
  end
end
