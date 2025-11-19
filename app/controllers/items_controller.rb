class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def show
    @items = Item.find(params[:id])
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

  def destroy
  end
end
