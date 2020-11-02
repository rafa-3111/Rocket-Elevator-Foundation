class CreateFactContact < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_contacts do |t|
      
      t.integer :contact_id #from leads table > user id
      t.date :creation_date
      t.string :company_name # from leads
      t.string :email #from leads
      t.string :project_name #from leads
      
      t.timestamps

    end
  end
end
