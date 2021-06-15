class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_one :purchase
  has_one_attached :image
  # ここから下は、ActiveHashのAssociations
  belongs_to :category
  belongs_to :state
  belongs_to :postage
  belongs_to :region
  belongs_to :shipping_date
  
  with_options presence: true do
    validates :name
    validates :information
    validates :image

      with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :state_id
        validates :postage_id
        validates :region_id
        validates :shipping_date_id
      end
    
      validates :price, numericality: {only_interger: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} 
  end
end
