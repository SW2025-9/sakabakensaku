class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save
    redirect_to shops_path
  end

  def edit
    @shop = Shop.find(params[:id])
  end
  
  def update
    shop = Shop.find(params[:id])
    @shop = Shop.find(params[:id])
    redirect_to shops_path
  end
  
  private
  
  def shop_params
    # :image を追加してください
    params.require(:shop).permit(:name, :image, :city, :detail)
  end
end
