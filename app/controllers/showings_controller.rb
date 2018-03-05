class ShowingsController < ApplicationController
  def create
    house = House.find(params[:id])
    Showing.create(showings_val).merge(house: house)
    redirect_back(fallback_location: '/houses')
  end
end
