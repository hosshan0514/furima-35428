class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_order = PurchaseOrder.new
  end

  def create
    @purchase_order = PurchaseOrder.new(order_params)
    if @purchase_order.valid?
      @purchase_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private 

  def  order_params
    params.require(:purchase_order).permit(:postal_code, :state_id, :city, :street_address, :suburb, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
