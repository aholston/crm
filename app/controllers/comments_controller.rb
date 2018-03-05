class CommentsController < ApplicationController
  def create
    house = House.find(params[:id])
    comment = Comment.create(comment_val)
    comment.update(house: house)
    redirect_back(fallback_location: '/houses')
  end
end
