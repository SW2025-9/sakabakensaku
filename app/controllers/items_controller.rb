class ItemsController < ApplicationController
  def index
  # もしURLに shop_id があれば、その店の商品だけを表示する
  if params[:shop_id]
    @shop = Shop.find(params[:shop_id])
    @items = @shop.items
  else
    @items = Item.all
  end
end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
    @reviews = @item.reviews.includes(:user).order(created_at: :desc)
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to items_path
  end
  
  def edit
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    
    @item.destroy
    
    respond_to do |format|
      format.html { redirect_to items_path, notice: "商品を削除しました" }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@item) }
    end
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to items_path, notice: "商品を更新しました"
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :price, :category, :detail, :liter, :image, :shop_id)
  end
end
