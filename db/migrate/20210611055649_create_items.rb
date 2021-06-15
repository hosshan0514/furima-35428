class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name
      t.text       :information
      t.integer    :category_id
      t.integer    :state_id
      t.integer    :postage_id 
      t.integer    :region_id  
      t.integer    :shipping_date_id
      t.integer    :price 
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
