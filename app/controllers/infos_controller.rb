class InfosController < ApplicationController
  def update
    info = Info.find(params[:id])
    info.update(info_val)
    redirect_back(fallback_location: '/houses')
  end
end
