class CreateDimCustomer < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_customers do |t|
      
      t.date :customer_creation_date
      t.string :company_name #customer table
      t.string :company_contact_full_name #customer table
      t.string :company_contact_email #customer table
      t.integer :elevator_number # customer > quote > elevator_number
      t.string :customer_city #customer table

      t.timestamps
    end
  end
end
