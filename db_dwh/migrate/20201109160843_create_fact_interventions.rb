class CreateFactInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_interventions do |t|
      t.int :EmployeeID
      t.int :BuildingID
      t.int :BatteryID
      t.int :ColumnID
      t.int :ElevatorID
      t.string :Statut
      t.string :Results
      t.string :Rapport

      t.timestamps
    end
  end
end


