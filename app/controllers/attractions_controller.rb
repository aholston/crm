class AttractionsController < ApplicationController
  def create
    house = House.find(params[:id])
    attraction = Attraction.create(attraction_val)
    attraction.update(house: house)
    attraction.save
    redirect_back(fallback_location: '/houses')
  end

end
