class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.belongs_to :battery
      t.string :column_type
      t.string :column_status
      t.integer :number_of_floors_served
      t.string :information
      t.string :notes
      t.timestamps
    end
  end
end