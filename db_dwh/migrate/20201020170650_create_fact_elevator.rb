class CreateFactElevator < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_elevators do |t|
      
      t.string :serial_number
      t.date :date_of_commissioning
      t.integer :building_id #from column > battery > building table
      t.integer :customer_id #from column > battery > building table
      t.string :building_city #from column > battery > building > address
      t.timestamps
    end
  end
end
