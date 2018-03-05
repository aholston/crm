class ShowingsController < ApplicationController
  def create
    house = House.find(params[:id])
    showing = Showing.create(showings_val)
    showing.update(house: house)
    redirect_back(fallback_location: '/houses')
  end
end
