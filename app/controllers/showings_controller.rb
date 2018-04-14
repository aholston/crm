class ShowingsController < ApplicationController
  def create
    house = House.find(params[:id])
    showing = Showing.create(showings_val)
    showing.update(house: house)
    redirect_to "houses/#{house.id}"
  end
end
