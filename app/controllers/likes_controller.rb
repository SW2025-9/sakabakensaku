class LikesController < ApplicationController
    def create
        @shop = Shop.find(params[:shop_id])
        current_user.likes.create(shop: @shop)
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @shop = Shop.find(params[:shop_id])
        @like = current_user.likes.find_by(shop_id: @shop.id)
        @like.destroy
        redirect_back(fallback_location: root_path)
    end
end
