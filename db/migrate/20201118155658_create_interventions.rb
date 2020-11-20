class CreateInterventions < ActiveRecord::Migration[5.2]
  def self.up
    create_table :interventions do |t|
      t.bigint :author_id 
      t.integer :employee_id
      t.integer :customer_id
      t.integer :building_id
      t.integer :battery_id
      t.integer :column_id
      t.integer :elevator_id
      t.string :status
      t.string :results
      t.string :repport
      t.datetime :intervention_start
      t.datetime :intervention_finish

      t.timestamps
    end
  end

  def self.down
    drop_tables :interventions
  end
end
