class AddBuildingReferences < ActiveRecord::Migration[5.2]
  def change
      create_table :building_details do |t|
      t.references :building, foreign_key: true
      t.string :information_key
      t.string :value
      t.timestamps
    end
      create_table :addresses do |t|
      t.references :building, foreign_key: true
      t.references :customer, foreign_key: true
      t.string :type_of_address
      t.string :status
      t.string :entity
      t.string :number_and_street
      t.string :suite_or_apartment
      t.string :city
      t.string :postal_code
      t.string :country
      t.string :notes
      t.timestamps
    end
    add_reference :buildings, :building_detail, index: true
    add_reference :buildings, :address, index: true
    add_reference :customers, :address, index: true
    add_reference :employees, :user, index: true
  end
end
