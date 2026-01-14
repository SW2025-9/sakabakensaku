class ShopsController < ApplicationController


  def index
    # 新着順で取得
    @shops = Shop.all.order(created_at: :desc)

    if params[:keyword].present?
      # 検索用キーワードを準備（部分一致のために % で囲む）
      search_term = "%#{params[:keyword]}%"

      if params[:search_type] == 'area'
        # エリア検索（addressカラムを検索すると仮定）
        @shops = @shops.where('city LIKE ?', search_term)
      else
        # 店舗名検索（nameカラムを検索）
        @shops = @shops.where('name LIKE ?', search_term)
      end
    end
  end

  def new
    @shop = Shop.new
  end
    
  def show
    @shop = Shop.find(params[:id])
    @review = Review.new
    @reviews = @shop.reviews.includes(:user).order(created_at: :desc)
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