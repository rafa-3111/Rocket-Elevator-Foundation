class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.belongs_to :user
      t.integer :apartments
      t.integer :floors
      t.integer :basements
      t.integer :businesses
      t.integer :elevator_shafts
      t.integer :parking_spaces
      t.integer :occupants
      t.integer :opening_hours
      t.integer :product_line
      t.decimal :install_fee
      t.decimal :total_price
      t.integer :unit_price
      t.integer :elevator_number

      t.timestamps
    end
  end
end
