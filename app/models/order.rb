class Order < ApplicationRecord
  belongs_to :purchase

  # with_options presence: true do
  #   validates :postal_code
  #   validates :state_id
  #   validates :city
  #   validates :street_address
  #   validates :suburb
  #   validates :phone_number
  # end
end
