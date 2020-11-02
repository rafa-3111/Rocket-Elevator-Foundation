class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.belongs_to :column
      t.string :serial_number
      t.string :elevator_model
      t.string :elevator_type
      t.string :elevator_status
      t.date :date_of_commissioning
      t.date :date_of_last_inspection
      t.string :certificate_of_inspection
      t.string :information
      t.string :notes
      t.timestamps
    end
  end
end
