class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :state_id, :city, :street_address, :suburb, :phone_number, :token
  #attr_accessorメソッドは、テーブルに存在するカラム以外に値を持たせたい場合に使用する。
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :state_id
    validates :city
    validates :street_address
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/} 
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, state_id: state_id, city: city, street_address: street_address, suburb: suburb, phone_number: phone_number, purchase_id: purchase.id)
  end
end

