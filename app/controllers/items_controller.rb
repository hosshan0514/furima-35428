class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :information, :category_id, :state_id, :postage_id, :region_id,
                                 :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   unless current_user == @item.user
  #     redirect_to action: :index
  #   end
  # end
end
