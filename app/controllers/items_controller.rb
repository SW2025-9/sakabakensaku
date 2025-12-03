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
