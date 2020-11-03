class FactQuotes < ActiveRecord::Migration[5.2]
  def change
      create_table :fact_quotes do |t|
      t.integer :quote_id #id from quote table
      t.datetime :quote_created_at #time stamp from quote table
      t.string :company_name # from customer table
      t.string :email # from customer > user table
      t.integer :elevator_number # from quote table
      
      t.timestamps
      end
  end
end
