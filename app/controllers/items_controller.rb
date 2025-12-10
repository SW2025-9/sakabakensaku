class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    item = Item.new(name: params[:item][:name],
                    liter: params[:item][:liter],
                    price: params[:item][:price],
                    category: params[:item][:category],
                    detail: params[:item][:detail])
    item.save
    redirect_to items_path
  end
  
  def edit
    @item = Item.find(params[:id])
  end

  def destroy
    # 表示用のレコードを用意。実プロジェクトに合わせて scope を調整。
    # ここでは最新の10件を持ってくる例:
    @items = Item.order(created_at: :desc).limit(10)
  end
  
  def update
    item = Item.find(params[:id])
    item.update(name: params[:item][:name],
                    liter: params[:item][:liter],
                    price: params[:item][:price],
                    category: params[:item][:category],
                    detail: params[:item][:detail])
    redirect_to items_path
  end
end
