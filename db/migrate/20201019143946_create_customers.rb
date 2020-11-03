class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.belongs_to :user
      t.string :company_name
      t.string :company_contact_full_name
      t.string :company_contact_phone
      t.string :company_contact_email
      t.string :company_description
      t.string :technical_authority_full_name
      t.string :technical_authority_phone_number
      t.string :technical_manager_email_service
      t.timestamps
    end
  end
end
