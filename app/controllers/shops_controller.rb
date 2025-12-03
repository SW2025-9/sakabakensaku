class ShopsController < ApplicationController
  before_action :require_login

  def index
    @shops = Shop.order(created_at: :desc).limit(20)
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
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

  private

  def shop_params
    params.require(:shop).permit(:name, :description, :address, :image) # 項目はモデルに合わせて増やす
  end
end
