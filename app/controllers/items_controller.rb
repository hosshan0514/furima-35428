class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private 
  def item_params
    params.require(:item).permit(:name, :information, :category_id, :state_id, :postage_id, :region_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

end
