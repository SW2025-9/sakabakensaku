class ItemLikesController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    current_user.likes.create(item: item)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    item = Item.find(params[:item_id])
    like = current_user.likes.find_by(item_id: item.id)
    like.destroy
    redirect_back(fallback_location: root_path)
  end
end