class InfosController < ApplicationController
  def update
    puts params
    info = Info.find(params[:id])
    puts info
    info.update(info_val)
    puts info.year
    redirect_back(fallback_location: '/houses')
  end
end
