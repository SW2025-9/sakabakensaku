class ShopsController < ApplicationController

  before_action :require_login

  def index
    @shops = Shop.order(created_at: :desc).limit(20)
  end

  def new
    @shop = Shop.new
  end
    
  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def create
    # 現在のユーザに紐づけて作る（user_id カラムが必要）
    @shop = current_user.shops.build(shop_params)
    if @shop.save
      redirect_to root_path, notice: "酒場を登録しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to shops_path
  end

  def update
    @shop = Shop.find(params[:id])
    shop = @shop.update(shop_params)
    redirect_to shop_path
  end
  
  
  private
  
  def shop_params
    params.require(:shop).permit(:name, :detail, :city, :image)
  end
  
end