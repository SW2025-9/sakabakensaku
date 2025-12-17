class ReviewsController < ApplicationController
  def create
    unless session[:user_id]
      redirect_to login_path, alert: "ログインしてください"
      return
    end

    @shop = Shop.find(params[:shop_id])
    @review = @shop.reviews.new(review_params)
    @review.user_id = session[:user_id]

    if @review.save
      redirect_to shop_path(@shop), notice: 'レビューを投稿しました'
    else
      redirect_to shop_path(@shop), alert: "投稿失敗: #{@review.errors.full_messages.join(', ')}"
    end
  end

  private

  # ★ここを修正してください
  def review_params
    # :content を許可する設定になっている必要があります
    params.require(:review).permit(:content)
  end
end