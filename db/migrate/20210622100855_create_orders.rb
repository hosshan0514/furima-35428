class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :postal_code,      null: false
      t.integer    :state_id,         null: false
      t.string     :city,             null: false
      t.string     :street_address,   null: false
      t.string     :suburb
      t.string     :phone_number,     null: false
      t.references :purchase,         foreign_key: true
      t.timestamps
    end
  end
end