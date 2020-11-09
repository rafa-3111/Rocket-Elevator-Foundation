class CreateFactInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_interventions do |t|
      t.int :employee_id
      t.int :building_id
      t.int :battery_id
      t.int :column_id
      t.int :elevator_id
      t.string :status
      t.string :results
      t.string :repport
      t.string :intervention_start
      t.string :intervention_finish
      t.string :status default: "Pending"

      t.timestamps
    end
  end
end

