class AttractionsController < ApplicationController
  def create
    info = Info.find(params[:id])
    Attraction.create(attraction_val).merge(info: info)
    redirect_back(fallback_location: '/houses')
  end

end
