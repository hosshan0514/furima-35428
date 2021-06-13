class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase
  has_one_attached :image
  
  with_options presence: true do
    validates :name
    validates :information
    validates :category_id
    validates :state_id
    validates :postage_id
    validates :region_id
    validates :shipping_date_id
    validates :image

    with_options numericality: {only_interger: true, :greater_than_or_equal_to: 300, :less_than_or_equal_to: 9999999} do
      validates :price
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 } 

  belongs_to :state
  validates :state_id, numericality: { other_than: 1 } 

  belongs_to :postage
  validates :postage_id, numericality: { other_than: 1 } 

  belongs_to :region
  validates :region_id, numericality: { other_than: 1 } 

  belongs_to :shipping_date
  validates :shipping_date_id, numericality: { other_than: 1 } 

end
