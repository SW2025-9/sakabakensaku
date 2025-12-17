class ReviewsController < ApplicationController
  def create
    unless session[:user_id]
      redirect_to login_path, alert: "ログインしてください"
      return
    end

    if params[:shop_id]
      # 酒場へのレビューの場合
      @shop = Shop.find(params[:shop_id])
      @review = @shop.reviews.new(review_params)
      redirect_dest = shop_path(@shop) # 戻る場所
    elsif params[:item_id]
      # 商品へのレビューの場合
      @item = Item.find(params[:item_id])
      @review = @item.reviews.new(review_params)
      redirect_dest = item_path(@item) # 戻る場所
    end

    @review.user_id = session[:user_id]

    if @review.save
      redirect_to redirect_dest, notice: 'レビューを投稿しました'
    else
      redirect_to redirect_dest, alert: "投稿失敗: #{@review.errors.full_messages.join(', ')}"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end