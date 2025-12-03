class ItemsController < ApplicationController
  def index
    # 表示用のレコードを用意。実プロジェクトに合わせて scope を調整。
    # ここでは最新の10件を持ってくる例:
    @items = Item.order(created_at: :desc).limit(10)
  end
end
